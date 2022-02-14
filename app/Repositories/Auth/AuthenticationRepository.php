<?php

namespace App\Repositories\Auth;

use DB,Mail;
use config,File;
use Validator;
use JWTAuth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\Eloquent\Builder;
use Modules\EmailTemplates\Entities\EmailTemplate;
use App\Models\User;
use Modules\Roles\Entities\Role;
use App\Models\JwtUserTokens;

class AuthenticationRepository implements AuthenticationRepositoryInterface {

    function __construct(User $User) {
       $this->User = $User;
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login($request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(requestErrorApiResponse($validator->errors()->getMessages()), 422);
        }

        if (User::where('email', $request->email)->exists()) {
            if (! $token =  auth()->attempt($validator->validated())) {
                return response()->json(['status_code'=> 401,'message' => 'Password is wrong'], 401);
            }
            if (auth()->user()->status == 0) {
                return response()->json(['status_code'=> 401,'message' => 'Your account is deactivate please contact to Support'], 401);
            }
            $user = User::where('email', $request->email)->first();
            
            $response = $this->createNewTokenForLogin($token); 
           
            return $response;
        }else{
             return response()->json(['status_code'=> 401,'message' => 'User not exists with this email address'], 401);
        }
    }

    public function register($request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|between:2,100',
            'email' => 'required|string|email|max:100|unique:users',
            'password' => 'required',
            'phone' => ['nullable'],
        ]);
        if($validator->fails()){
            return response()->json(requestErrorApiResponse($validator->errors()->getMessages()), 422);
        }
        return $this->findOrCreateDirect($request);
    }    


    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh() {
        return $this->createNewToken(auth()->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function createNewToken($token){
        $user = auth()->user();
        return response()->json([
            'status_code' => 200,
            'access_token' => $token,
            'token_type' => 'Bearer',
            //'expires_in' => auth()->factory()->getTTL() * 60,
            'user' => auth()->user()
        ], 200);
    }

    protected function createNewTokenForLogin($token){
        $user = auth()->user();
        $user['user_image_path'] = auth()->user()->S3Url;
        return response()->json([
            'status_code' => 200,
            'message' => 'Login successfully',
            'access_token' => $token,
            'token_type' => 'Bearer',
            //'expires_in' => auth()->factory()->getTTL() * 60,
            'data' => $user
        ], 200);
    }

    protected function createNewTokenForRegisterLogin($token){
        $user = auth()->user();
        $user['user_image_path'] = auth()->user()->S3Url;
        return response()->json([
            'status_code' => 200,
            'message' => 'User registered successfully',
            'access_token' => $token,
            'token_type' => 'Bearer',
            //'expires_in' => auth()->factory()->getTTL() * 60,
            'data' => $user
        ], 200);
    }

    public function sendWelcomeEmailForUser($user,$password)
    {
        $emailtemplate = EmailTemplate::where('slug', 'create-user')->first();
        $subject = $emailtemplate->subject;
        $body = $emailtemplate->body;
        $body = str_replace('[username]', ucfirst($user->first_name), $body);
        $body = str_replace('[email]', $user->email, $body);
        $body = str_replace('[password]', $password, $body);
        $jobData = [
            'content' => $body,
            'user' => $user,
            'to' => $user->email,
            'subject' => $subject
        ];
        dispatch(new \App\Jobs\SendEmailJob($jobData));
    }

    public function sendForgotPsswordRequest($request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email|max:100|unique:users',
        ]);
        if($validator->fails()){
            return response()->json(requestErrorApiResponse($validator->errors()->getMessages()), 422);
        }
    }

    public function findOrCreate($providerdata)
    {
        $account =  LinkedSocialAccount::where('provider_name', $providerdata->provider_name)
                   ->where('provider_id', $providerdata->provider_id)
                   ->first();
        if ($account) {
            $user = $account->user;
            //Login After Registered user
            $authdata['email'] = $user->email;
            auth()->login($user);
            if (!$token = JWTAuth::fromUser($user)) {
                return response()->json(['status_code'=> 401,'error' => 'Unauthorized'], 401);
            }
            return $this->createNewTokenForRegisterLogin($token); 
        } else {
            $user = User::where('email', $providerdata->email)->first();
            if (! $user) {
                $res['status_code'] = 200;
                $res['message'] = 'User Not found';
                $res['data']['new_user'] = true;
                return response()->json($res, 200);
                $password =  $providerdata->password;
                $providerdata['password'] = bcrypt($password);
                $providerdata['email_verified_at'] = time();
                $providerdata['image'] = 'noimage.jpg';
                if($providerdata->get('name')== ''){
                    $providerdata['name'] = $providerdata->email;
                }
                $user = User::create($providerdata->all());
                $role = Role::where('slug','customer')->first();
                $user->assignRole([$role->id]);
                $password =  $providerdata->password;
                $this->sendWelcomeEmailForUser($user,$password);
            }
            $user->accounts()->create([
                'provider_id'   => $providerdata->provider_id,
                'provider_name' => $providerdata->provider_name,
            ]);
            auth()->login($user);
            if (!$token = JWTAuth::fromUser($user)) {
                return response()->json(['status_code'=> 401,'error' => 'Unauthorized'], 401);
            }
            return $this->createNewTokenForRegisterLogin($token); 
        }
    }

    public function findOrCreateDirect($providerdata)
    {
        $user = User::where('email', $providerdata->email)->first();
        if (! $user) {
            $password =  $providerdata->password;
            $providerdata['password'] = bcrypt($password);
            $providerdata['email_verified_at'] = time();
            $providerdata['image'] = 'noimage.jpg';
            if($providerdata->get('name')== ''){
                $providerdata['name'] = $providerdata->email;
            }
            $user = User::create($providerdata->all());
            //$password =  $providerdata->password;
            //$this->sendWelcomeEmailForUser($user,$password);
        }
        auth()->login($user);
        if (!$token = JWTAuth::fromUser($user)) {
            return response()->json(['status_code'=> 401,'error' => 'Unauthorized'], 401);
        }
        return $this->createNewTokenForRegisterLogin($token); 
    }

    public function logout($request)
    {
        auth()->logout();
        return response()->json(['status_code'=> 200,'message' => 'User successfully signed out'], 200);
    }
}

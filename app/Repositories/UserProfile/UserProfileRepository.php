<?php

namespace App\Repositories\UserProfile;

use DB,Mail;
use config,File;
use Validator;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\Eloquent\Builder;
use Modules\EmailTemplates\Entities\EmailTemplate;
use App\Models\User;
use Modules\Roles\Entities\Role;
use Modules\Login\Entities\MobileVerification;
use Modules\Login\Entities\OtpVerifications;
use Illuminate\Support\Facades\Storage;
use Modules\Products\Entities\Products;
use Modules\Advertisements\Entities\Advertisements;
use App\Models\Loan;
use App\Models\Emi;

class UserProfileRepository implements UserProfileRepositoryInterface {

    function __construct(User $User) {
       $this->User = $User;
    }

    public function getUserDetails($request)
    {
        $user = auth()->user();

        $user['user_image_path'] = $user->S3Url;
        $response['status_code'] = 200;
        $response['message'] = 'User Profile details';
        $response['data'] = $user;
        return response()->json($response, $response['status_code'])->withHeaders(checkVersionStatus($request->headers->get('Platform'), $request->headers->get('Version')))->setStatusCode($response['status_code']);
    }

    public function userUpdate($request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|between:2,100',
            //'phone' => ['required'],
        ]);
        if($validator->fails()){
            return response()->json(requestErrorApiResponse($validator->errors()->getMessages()), 422);
        }
        $user = auth()->user();
        if($user){
            if($request->get('image')){
                $request['image'] = $request->get('image');
            }else{
                $request['image'] = auth()->user()->image;
            }
            $user->update($request->all());
            $user = User::find(auth()->user()->id);
            $user['user_image_path'] = $user->S3Url;
            $response['status_code'] = 200;
            $response['message'] = 'User updated successfully';
            $response['data'] = $user;
            return response()->json($response, $response['status_code'])->withHeaders(checkVersionStatus($request->headers->get('Platform'), $request->headers->get('Version')))->setStatusCode($response['status_code']);
        }else{
            $response['status_code'] = 400;
            $response['message'] = 'User not found';
            $response['data'] = $user;
            return response()->json($response, $response['status_code'])->withHeaders(checkVersionStatus($request->headers->get('Platform'), $request->headers->get('Version')))->setStatusCode($response['status_code']);
        }
    }

    public function userChangePassword($request)
    {
      $validator = Validator::make($request->all(), [
            'confirm_password' => 'required|same:new_password',
            'new_password' => 'required|min:8',
            'old_password' => 'required',
        ]);
        if($validator->fails()){
            return response()->json(requestErrorApiResponse($validator->errors()->getMessages()), 422);
        }

        $user = auth()->user();
        if($user){
            try {
               if ((Hash::check(request('old_password'), auth()->user()->password)) == false) {
                  return response()->json([
                    'status_code' => 400,
                    'message' => 'Your old password is invalid',
                    'data' => []
                  ], 400);
               } else if ((Hash::check(request('new_password'), auth()->user()->password)) == true) {
                     return response()->json([
                       'status_code' => 400,
                       'message' => 'Please enter a password which is not similar then current password.',
                       'data' => []
                      ], 400);
               } else {
                   $user->update(['password' => Hash::make($request['new_password'])]);
                  return response()->json([
                    'status_code' => 200,
                    'message' => 'Password changed successfully',
                    'data' => []
                  ], 200);
               }
           } catch (\Exception $e) {
               return response()->json([
                    'status_code' => 400,
                    'message' => 'Bad request',
                    'data' => []
                ], 400);
           }

         }else{
            return response()->json([
                'status_code' => 404,
                'message' => 'Not Found',
                'data' => auth()->uer()
            ], 404); 
        }
   
    }

    public function getSignedURL($request)
    {
        $location = 'images/user';
        $s = strtoupper(md5(uniqid(rand(),true))); 
        $guidText = 
            substr($s,0,8) . '-' . 
            substr($s,8,4) . '-' . 
            substr($s,12,4). '-' . 
            substr($s,16,4). '-' . 
            substr($s,20); 
        $prevFileName = $location.'/'.$guidText.'.jpg';
        $filename = $guidText.'.jpg';
        $prevFileUrl = \Storage::disk('s3')->url($prevFileName);
        $s3 = \Storage::disk('s3');
        $client = $s3->getDriver()->getAdapter()->getClient();
        $expiry = "+20 minutes";
        $bucketName = env("AWS_BUCKET");
        $command = $client->getCommand('putObject', [
            'Bucket' => $bucketName,
            'Key'    => $prevFileName,
            'ACL' => 'public-read',
            'ContentType' => 'image/jpeg'
        ]);

        $return = $client->createPresignedRequest($command, $expiry);
        if(isset($return)) {
            $signeUrl = (string)$return->getUri();
            $response = [
                'status_code' =>  200,
                'message' =>  'URL created successfully',
            ];
            $response['data']['url'] = $signeUrl;
            $response['data']['filename'] = $filename;
            $response['data']['preview_file_url'] = $prevFileUrl;
            return response()->json($response, $response['status_code'])->withHeaders(checkVersionStatus($request->headers->get('Platform'), $request->headers->get('Version')))->setStatusCode($response['status_code']);
        } else {
            return response()->json([
                'status_code' => 400, 
                'message' => 'URL not created', 
                'data'=> $dataArray
            ],400)->withHeaders(checkVersionStatus($request->headers->get('Platform'), $request->headers->get('Version')))->setStatusCode(400);
        }
    }


    public function getAutocompleteData($request)
    {
        $products = array();
        if($request->get('query')){
            $products = Products::where('status','active')->where('expiry_date', '>', utctodtc_4now())->orderBy('id', 'DESC');
            $products = $products->where('name', 'LIKE', '%'.$request->get('query').'%');
            $products = $products->limit(15)->get();
        } 
       
        $response['status_code'] = 200;
        if (count($products)>0) {
            $response['message'] = 'Products data listing.';
            foreach ($products as $key => $list) {
                $response['data'][$key]['id'] = $list->id;
                $response['data'][$key]['slug'] = $list->slug;
                $response['data'][$key]['name'] = $list->name;
                $response['data'][$key]['product_image_url'] = $list->S3Url;
            }
        } else {
            $response['status_code'] = 200;
            $response['message'] = 'There is no record found.';
            $response['data'] = array();
        }
        return response()->json($response, $response['status_code'])->withHeaders(checkVersionStatus($request->headers->get('Platform'), $request->headers->get('Version')))->setStatusCode($response['status_code']);
    }

    public function makeNewLoan($request){
        $validator = Validator::make($request->all(), [
            'loan_amount' => 'required',
            'loan_term_in_week' => 'required|integer',
            'rate_of_interest' => 'required'
        ]);
        if($validator->fails()){
            return response()->json(requestErrorApiResponse($validator->errors()->getMessages()), 422);
        }

        $user = auth()->user();
        if($user){
            $data=[
                'user_id'=>$user->id,
                'loan_amount'=>$request->loan_amount,
                'loan_term_in_week'=>$request->loan_term_in_week,
                'rate_of_interest'=>$request->rate_of_interest,
                'start_date'=>date('Y-m-d',strtotime(date('Y-m-d')))
            ];
            $loan = Loan::create($data);
            $payment_date = date('Y-m-d');
            $emi = $this->PMT($request->rate_of_interest,$request->loan_term_in_week,$request->loan_amount);
            $emiData = [];
            $balance = $request->loan_amount;
            $j=0;
            for($i=1;$i<=$request->loan_term_in_week;$i++){
                $interest_paid = round((($request->rate_of_interest/100)*$balance)/12);
                $emiData[$j]['interest_paid'] = $interest_paid;

                $principal_paid = round($emi - $interest_paid);
                $emiData[$j]['principal_paid'] = $principal_paid;

                $balance = round($balance - $principal_paid);
                $emiData[$j]['balance'] = $balance;

                $payment_date = date('Y-m-d',strtotime("+1 week",strtotime($payment_date)));
                $emiData[$j]['payment_date'] = $payment_date;

                $emiData[$j]['monthly_emi'] = round($emi);
                $emiData[$j++]['loan_id'] = $loan->id;
            }
            Emi::insert($emiData);
            $response['status_code'] = 200;
            $response['message'] = 'Congratulation! your loan approved and emi created';
            $response['loan_summary'] = $data;
            $response['emi'] = $emiData;
            return response()->json($response, $response['status_code'])->setStatusCode($response['status_code']);
        }
    }

    public function getLoans($request){
        $user = auth()->user();
        if($user){
            $loan = Loan::where('user_id',$user->id)->get();
            $response['status_code'] = 200;
            $response['message'] = 'Loan list';
            $response['data'] = $loan;
            return response()->json($response, $response['status_code'])->setStatusCode($response['status_code']);
        }
    }

    public function getLoanDetails($request){
        $validator = Validator::make($request->all(), [
            'loan_id' => 'required',
        ]);
        if($validator->fails()){
            return response()->json(requestErrorApiResponse($validator->errors()->getMessages()), 422);
        }

        $user = auth()->user();
        if($user){
            $loan = Loan::where('user_id',$user->id)->where('id',$request->loan_id)->first();
            if($loan){
                $response['status_code'] = 200;
                $response['message'] = 'Loan list';
                $response['data'] = $loan;
                $response['emis'] = $loan->emis;
                return response()->json($response, $response['status_code'])->setStatusCode($response['status_code']);
            }else{
                return response()->json([
                    'status_code' => 400,
                    'message' => 'Loan data not found for requested loan id. please try again.',
                    'data' => []
                   ], 400);

            }
        }

    }

    public function PMT($interest,$period,$loan_amount){
        $interest = (float)$interest;
        $period = (float)$period;
        $loan_amount = (float)$loan_amount;
        $period = $period;
        $interest = $interest / 1200;
        $amount = $interest * -$loan_amount * pow((1+$interest),$period) / (1 - pow((1+$interest), $period));
        return $amount;
    }
      
    public function showValue($value){
        echo number_format($value,2);
    }    
}
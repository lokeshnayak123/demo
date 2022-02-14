<?php

namespace App\Http\Controllers\Api\Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Api\BaseController;
use Symfony\Component\HttpFoundation\Response;
use App\Repositories\Auth\AuthenticationRepositoryInterface as AuthenticationRepo;

class AuthenticationController extends BaseController
{

    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct(AuthenticationRepo $AuthRepo) {
        $this->AuthRepo = $AuthRepo;
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
        return auth()->shouldUse('api');
    }

    /**
     * Login a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    { 
        $response = $this->AuthRepo->login($request);
        return $response;
    }

    /**
     * Register a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request) {
        $response = $this->AuthRepo->register($request);
        return $response;
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout(Request $request) {
        $response = $this->AuthRepo->logout($request);
        return $response;
    }
}
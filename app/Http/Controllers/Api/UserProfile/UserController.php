<?php

namespace App\Http\Controllers\Api\UserProfile;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Http\Controllers\Api\BaseController;
use Symfony\Component\HttpFoundation\Response;
use App\Repositories\UserProfile\UserProfileRepositoryInterface as UserProfileRepo;

class UserController extends BaseController
{
    /**
     * Create a new UserController instance.
     *
     * @return void
     */
    public function __construct(UserProfileRepo $UserRepo,Request $request) {
        $this->UserRepo = $UserRepo;
        $this->middleware('auth:api');
        return auth()->shouldUse('api');
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userProfile(Request $request) {
        $response = $this->UserRepo->getUserDetails($request);
        return $response;
    }

	/**
     * User Update.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userUpdate(Request $request) {
        $response = $this->UserRepo->userUpdate($request);
        return $response;
    }

    /**
     * User Change Password.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userChangePassword(Request $request) {
        $response = $this->UserRepo->userChangePassword($request);
        return $response;
    }
    /**
     * Make new Loan with Emi
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function applyLoan(Request $request) {
        $response = $this->UserRepo->makeNewLoan($request);
        return $response;
    }
    /**
     * Get all user loans
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function myLoans(Request $request) {
        $response = $this->UserRepo->getLoans($request);
        return $response;
    }
    /**
     * Get loan details
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function getLoanDetails(Request $request) {
        $response = $this->UserRepo->getLoanDetails($request);
        return $response;
    }
}
<?php

namespace App\Repositories\UserProfile;


interface UserProfileRepositoryInterface
{
    public function getUserDetails($request);
    
    public function userUpdate($request);

    public function userChangePassword($request);

    public function getSignedURL($request);
    
    public function getAutocompleteData($request);

    public function makeNewLoan($request);

    public function getLoans($request);

    public function getLoanDetails($request);
}


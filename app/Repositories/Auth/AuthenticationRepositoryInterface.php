<?php

namespace App\Repositories\Auth;


interface AuthenticationRepositoryInterface
{
    public function login($request);
    
    public function register($request);
    
    public function sendForgotPsswordRequest($request);
}


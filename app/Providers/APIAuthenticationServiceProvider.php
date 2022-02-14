<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class APIAuthenticationServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
       $this->getAuthRepo();
       $this->getUserRepo();
    }

    //Use for Authentication Api
    public function getAuthRepo() {
        return $this->app->bind('App\Repositories\Auth\AuthenticationRepositoryInterface','App\Repositories\Auth\AuthenticationRepository');
    }

    //Use for UserProfile Api
    public function getUserRepo() {
        return $this->app->bind('App\Repositories\UserProfile\UserProfileRepositoryInterface','App\Repositories\UserProfile\UserProfileRepository');
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}

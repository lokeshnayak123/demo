<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

$api = app('Dingo\Api\Routing\Router');
$api->version(['v1'],['namespace' => 'App\Http\Controllers\Api','middleware' =>'app_version'],  function ($api)
{
    $api->post('login','Auth\AuthenticationController@login');
    $api->post('register','Auth\AuthenticationController@register');
});

$api->version(['v1'],['namespace' => 'App\Http\Controllers\Api'],  function ($api)
{
    //
});

$api->version(['v1'],['namespace' => 'App\Http\Controllers\Api','middleware' => ['jwt.verify']],  function ($api)
{
    //Use api for Auth
	$api->post('logout','Auth\AuthenticationController@logout');
	$api->post('refresh','Auth\AuthenticationController@refresh');
	$api->post('apply-loan','UserProfile\UserController@applyLoan');
	$api->post('my-loans','UserProfile\UserController@myLoans');
	$api->post('get-loan-details','UserProfile\UserController@getLoanDetails');
});

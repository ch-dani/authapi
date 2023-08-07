<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// User registration
Route::post('/register', 'App\Http\Controllers\Auth\RegisterController@register');
Route::post('/sendVerificationEmail', 'App\Http\Controllers\Auth\RegisterController@sendVerificationEmail');
Route::post('/verify-otp', 'App\Http\Controllers\Auth\RegisterController@matchOTP');
Route::get('/getUserRoles', 'App\Http\Controllers\Auth\RegisterController@getUserRoles');

// User login
Route::post('/login', 'App\Http\Controllers\Auth\LoginController@login');
Route::post('/social-login', 'App\Http\Controllers\Auth\LoginController@socialLogin');

// User logout



// Get authenticated user

Route::get('/users', 'App\Http\Controllers\Auth\RegisterController@getAll');
Route::get('/users/{id}', 'App\Http\Controllers\Auth\LoginController@getById');
Route::put('/users/{id}', 'App\Http\Controllers\Auth\LoginController@updateById');
Route::get('/userRoles', 'App\Http\Controllers\Auth\RegisterController@getUserRoles');


// Password reset
Route::post('/password/reset', 'App\Http\Controllers\Auth\ForgotPasswordController@sendResetLinkEmail');
Route::post('/password/reset/{token}', 'App\Http\Controllers\Auth\ResetPasswordController@reset');


Route::group(["middleware"=>"auth:sanctum"],function(){
    Route::post('/logout', 'App\Http\Controllers\Auth\LoginController@logout');
    Route::get('/get-events', 'App\Http\Controllers\EventController@getAllEvents');
    Route::get('/get-events/{id}', 'App\Http\Controllers\EventController@getEvent');
    Route::get('/get-event-teams/{id}', 'App\Http\Controllers\EventController@getEventTeam');
    Route::get('/get-all-sports', 'App\Http\Controllers\EventController@getAllSports');
    Route::get('/get-sport/{id}', 'App\Http\Controllers\EventController@getSport');
    Route::get('/add-sport-to-cart/{id}', 'App\Http\Controllers\EventController@addSportInCart');
    Route::get('/get-my-sports', 'App\Http\Controllers\EventController@getMySports');
    Route::get('/get-my-cart', 'App\Http\Controllers\EventController@getMyCart');
    Route::get('/get-sport-checkout', 'App\Http\Controllers\EventController@getMySportCheckout');
    Route::get('/remove-from-cart/{id}', 'App\Http\Controllers\EventController@removeFromCart');
});
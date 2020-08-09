<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
Route::get('users', 'StskController@index');
Route::group(['middleware' => 'web'], function () {
    Route::get('/{any}', 'StskController@index')->where('any', '.*');
});

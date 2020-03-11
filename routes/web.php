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

Route::get('/', function () {
    return view('welcome');
});



Route::get('/', [
	'uses'=>'EmployeesController@index',
	'as'=>'/'
]);

Route::get('/create', [
	'uses'=>'EmployeesController@create',
	'as'=>'homes'
]);
Route::post('/add', [
	'uses'=>'EmployeesController@store',
	'as'=>'employee'
]);

Route::get('/show/{id}', [
	'uses'=>'EmployeesController@show',
	'as'=>'view'
]);
Route::get('/edit/{id}', [
	'uses'=>'EmployeesController@edit',
	'as'=>'edit'
]);
Route::post('/update', [
	'uses'=>'EmployeesController@update',
	'as'=>'update'
	]);
Route::get('/delete/{id}', [
	'uses'=>'EmployeesController@destroy',
	'as'=>'delete'
]);





Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

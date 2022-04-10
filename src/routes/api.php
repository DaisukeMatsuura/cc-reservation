<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\RegisterController;

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

// Public Routes
Route::controller(RegisterController::class)->group(function(){
    Route::post('login', 'login');
});

// Protected Routes
Route::group(['middleware' => ['auth:sanctum']], function () {
    // Route::post('register', 'register');

    // テスト
    Route::get('/test', function () {
        return response()->json([
            'message' => 'Authenticated',
        ], 200);
    });
});

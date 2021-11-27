<?php

use App\Http\Livewire\Frontpage;
use Illuminate\Support\Facades\Route;

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

// Route::get('/', function () {
//     return view('welcome');
// });

// Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
//     return view('dashboard');
// })->name('dashboard');

// NOTE: The purpose of this route is to ensure that we can only access the
// routes if and only if we are logged in
Route::group(['middleware' => ['auth:sanctum','verified',]], function(){

    // NOTE: This is the route to dashboard
    Route::get('/dashboard', function(){
        return view('dashboard');
    })->name('dashboard');

    // NOTE: and this is the route to the pages
    Route::get('/pages', function(){
        return view('admin/pages');
    })->name('pages');

    Route::get('/navigation-menus', function(){
        return view('admin/navigation-menus');
    })->name('navigation-menus');

});

Route::get('/{urlslug}', Frontpage::class);

Route::get('/', Frontpage::class);



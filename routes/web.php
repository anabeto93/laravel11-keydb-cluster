<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    cache()->store('redis')->set(request()->ip(), 'Hello, World!', 60);
    return view('welcome');
});

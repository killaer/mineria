<?php

/**
 * Rutas de Autenticación
 */
Auth::routes();

/**
 * Ruta raíz
 */
Route::get('/', function () {
    return redirect()->route('login');
});

/**
 * Rutas para usuarios autenticados, usuarios no autenticados en estas rutas son redirigidos al login
 */
Route::get('/home', 'HomeController@index')->name('home'); # Vista pagina principal de autenticados
Route::get('/workers', 'WorkerController@index')->name('workers'); # Vista lista de workers
Route::get('/workers/nuevo', 'WorkerController@newAction')->name('new_worker'); # Vista nuevo worker
Route::get('/locations', 'LocationController@index')->name('locations'); #Vista lista de locaciones
Route::get('/locations/nuevo', 'LocationController@newAction')->name('new_location'); # Vista nueva locacion

Route::post('/locations/save', 'LocationController@saveAction')->name('save_location'); # Guardar nueva locacion

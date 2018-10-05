<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WorkerController extends Controller
{
    #Solo usuarios autenticados tienen acceso a los metodos de este controlador
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Ruta para mostrar todos los workers existentes, por autenticar y sin autenticar
     * Este modulo utiliza AngularJS
     * @param Request $request
     * @return View
     */
    public function index(Request $request)
    {
        return view('worker.index');
    }

    /**
     * Ruta para crear nuevo worker
     * Este modulo utiliza AngularJS
     * @param Request $request
     * @return View
     */
    public function newAction(Request $request)
    {
        return view('worker.new');
    }
}

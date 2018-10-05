<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\SaverTools;

class LocationController extends Controller
{
    use SaverTools;

    #Solo usuarios autenticados tienen acceso a los metodos de este controlador
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Ruta para ver todas las locaciones y sus detalles
     * @param Request $request
     * @return View
     */
    public function index(Request $request)
    {
        return view('location.index');
    }

    /**
     * Ruta para agregar las nuevas locaciones
     * @param Request $request
     * @return View
     */
    public function newAction(Request $request)
    {
        return view('location.new');
    }

    /**
     * Ruta POST para guardar las locaciones
     * @param Request $request
     * @return View
     */
    public function saveAction(Request $request)
    {

    }
}

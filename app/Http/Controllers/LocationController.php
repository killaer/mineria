<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\SaverTools;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

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
    public function saveAction(\App\Http\Requests\StoreLocation $request)
    {
        try {
            
            DB::beginTransaction();
            
            $this->saveLocation($request->all());
            
            DB::commit();

            return response()->json([
                'success' => 'Se ha registrado exitosamente la locación',
            ]);

        } catch(\Exception $e){
            
            DB::rollback();
            
            return response()->json([
                'error' => $e->getMessage()    
            ]);
        }
    }
}

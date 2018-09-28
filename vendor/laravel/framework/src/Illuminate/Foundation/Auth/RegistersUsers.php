<?php

namespace Illuminate\Foundation\Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;
use Illuminate\Auth\Events\Registered;
use \App\Entity;

trait RegistersUsers
{
    use RedirectsUsers, \App\Traits\RegisterTools, \App\Traits\MailerTools;

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\Http\Response
     */
    public function showRegistrationForm()
    {
        Session::forget('register');
        $labels = $this->makeAndHash(['correo','username','password', 'apelnomb'], 'register');
        return view('auth.register', $labels);
    }

    /**
     * Handle a registration request for the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        try{
            $data = $request->all();
            unset($data['confirm']);
            $label = $this->unravelHash($data, 'register');
            $this->validateRegister($label);
            
            DB::beginTransaction();

            $entity = Entity::create([
                'tipo_e' => 2, 
                'cod_e' => 'unknowValue', 
                'nombre_e' => $label['apelnomb'], 
                'activo_e' => false,
            ]);

            $entity->user()->create([
                'usuario' => $label['username'], 
                'correo' => $label['correo'], 
                'password_usuario' => bcrypt($label['password']),
            ]);

            event(new Registered($entity->user()));

            DB::commit();
            Session::forget('register');
            return response()->json(['success' => 'Se completo el registro exitosamente']);

        } catch(\Exception $e){
            
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()]);
        }
    }

    /**
     * Yo me encargo de validar el formulario de Registro, Excepción si es 
     * false y true si es valido.
     * @return Boolean|Object
     */
    protected function validateRegister(array $labels)
    {
        $val = Validator::make($labels, [
            'correo' => 'required|email|between:0,30',
            'password' => 'required|between:0,32',
            'apelnomb' => 'required|between:0,128',
        ]);

        if($val->fails()){
            throw new \Exception('Campos Invalidos');
        } else {
            return true;
        }
    }
}

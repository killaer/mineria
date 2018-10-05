<?php

namespace App\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

trait SessionTools
{

    /**
     * Toma todos los perfiles que tiene un usuario y los guada en session
     * @param null
     * @return void
     */
    public static function detailProfiles()
    {
        $perfiles = Auth::user()->usuarioPerfil;
        $secured = [];
        foreach($perfiles as $auth){
            $secured[] = $auth->perfil->id;
        }
        Session::put('perfiles', $secured);
    }

    /**
     * Verifica que el usuario es administrador
     * @param null
     * @return void
     */
    public static function isAdmin()
    {
        if(in_array(1, Session::get('perfiles')))
        {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Verifica que el usuario es tecnico
     * @param null
     * @return void
     */
    public static function isTechnician()
    {
        if(in_array(2, Session::get('perfiles')))
        {
            return true;
        } else {
            return false;
        }   
    }

    /**
     * Verifica que el usuario es propietario    
     * @param null
     * @return void
     */
    public static function isOwner()
    {
        if(in_array(3, Session::get('perfiles')))
        {
            return true;
        } else {
            return false;
        } 
    }

}
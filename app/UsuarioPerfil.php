<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UsuarioPerfil extends Model
{
    protected $table = 'usuario_perfil';
    public $timestamps = false;

    protected $fillable = [
        'id_perfil','id_usuario', 'default',
    ];

    public function perfil(){
        return $this->belongsTo(\App\Perfil::class, 'id');
    }

    public function usuario(){
        return $this->belongsTo(\App\Usuario::class, 'id_e');
    }
}

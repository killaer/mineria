<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Usuario extends Authenticatable
{
    use Notifiable;

    protected $table = 'usuario';
    protected $primaryKey = 'id_e';
    public $timestamps = false;

    protected $fillable = [
        'id_e','correo', 'password','active','username','apelnomb'
    ];

    protected $hidden = [
        'password',
    ];

    public function entidad(){
        return $this->BelongsTo(\App\Entidad::class, 'id');
    }

    public function usuarioPerfil(){
        return $this->hasMany(\App\UsuarioPerfil::class, 'id_usuario');
    }
}

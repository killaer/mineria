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
        'id_e','correo', 'password','active'
    ];

    protected $hidden = [
        'password',
    ];

    public function entidad(){
        return $this->BelongsTo(\App\Entidad::class, 'id');
    }
}

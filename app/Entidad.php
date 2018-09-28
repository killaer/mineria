<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Entidad extends Model
{
    protected $table = 'entidad';
    protected $primaryKey = 'id';
    public $timestamps = true;

    protected $fillable = [
        'id','tipo_e', 'cod_e', 'activo_e',
    ];

    public function usuarios(){
        return $this->hasOne(\App\Usuario::class, 'id_e');
    }
}

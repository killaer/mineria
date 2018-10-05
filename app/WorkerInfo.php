<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WorkerInfo extends Model
{
    protected $table = 'worker_info';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id_location', 'estatus','fecha_def'
    ];

    public function workerInfoData(){
        return $this->BelongsTo(\App\WorkerInfoData::class, 'id_wi');
    }

    public function location(){
        return $this->hasMany(\App\Locacion::class, 'id_e');
    }
}

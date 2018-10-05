<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Worker extends Model
{
    protected $table = 'worker';
    protected $primaryKey = 'id_e';
    public $timestamps = false;

    protected $fillable = [
        'id_e', 'cod_serial','mac_address',
        'hostname','workername'
    ];

    public function entidad(){
        return $this->BelongsTo(\App\Entidad::class, 'id');
    }

    public function itemWorker(){
        return $this->BelongsTo(\App\ItemWorker::class, 'id_worker');
    }
    
    public function workerInfo(){
        return $this->BelongsTo(\App\WorkerInfo::class, 'id_worker');
    }
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WorkerInfoData extends Model
{
    protected $table = 'worker_info_data';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'chain_nro', 'id_wic','id_wi',
        'valor_wic'
    ];

    public function workerInfoCampos(){
        return $this->hasMany(\App\WorkerInfoCampos::class, 'id');
    }

    public function workerInfo(){
        return $this->hasMany(\App\WorkerInfo::class, 'id');
    }

}

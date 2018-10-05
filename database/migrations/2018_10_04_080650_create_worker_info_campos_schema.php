<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorkerInfoCamposSchema extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('worker_info_campos', function(Blueprint $table) {
            $table->increments('id');
            $table->integer('tipo_wic')->comment('1: string, 2: integer')->default(2);
            $table->string('nombre_wic');
            $table->string('nombre_campo_wic');
            $table->string('descripcion_wic');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('worker_info_campos');
    }
}

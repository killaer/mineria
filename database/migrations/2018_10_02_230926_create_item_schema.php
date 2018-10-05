<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemSchema extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipo_item', function(Blueprint $table){
            $table->increments('id');
            $table->string('descripcion');
        });

        Schema::create('item', function(Blueprint $table){
            $table->increments('id');
            $table->integer('tipo_item');
            $table->string('nombre_item');
            $table->string('marca_item');
            $table->string('modelo_item');
            $table->string('version_item');
            $table->string('descripcion_item');
            $table->string('barcode_item');
            $table->string('cantidad_item');
            $table->char('cod_serial_item',8);
            $table->foreign('tipo_item')->references('id')->on('tipo_item');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('item');
        Schema::dropIfExists('tipo_item');
    }
}

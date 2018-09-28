<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsuarioSchema extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        Schema::create('perfil', function (Blueprint $table) {
            $table->increments('id');
            $table->string('descripcion');
        });

        Schema::create('usuario', function (Blueprint $table) {
            $table->integer('id_e')->unique();
            $table->string('correo')->index();
            $table->string('password', 64);
            $table->string('username')->unique();
            $table->boolean('active')->default(false);
            $table->primary('id_e');
            $table->rememberToken();
            $table->foreign('id_e')->references('id')->on('entidad');
        });
        
        Schema::create('usuario_perfil', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_e');
            $table->integer('id_perfil');
            $table->foreign('id_e')->references('id_e')->on('usuario');
            $table->foreign('id_perfil')->references('id')->on('perfil');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('usuario_perfil');
        Schema::dropIfExists('usuario');
        Schema::dropIfExists('perfil');
    }
}

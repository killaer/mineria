<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserProfileSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('perfil')->insert([
            ['descripcion' => 'administrador'],
            ['descripcion' => 'tecnico'],
            ['descripcion' => 'propietario']
        ]);
    }
}

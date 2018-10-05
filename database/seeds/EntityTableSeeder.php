<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Entidad;
use App\Usuario;

class EntityTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for($a = 0; $a <= 20; $a++){
            
            $counter = Entidad::where('tipo_e', 3)->count() + 1;
            $nombre = (string) ('USUARIO_'. $counter);
            
            $entidad = Entidad::create([
                'tipo_e' => 3,
                'cod_e' => $nombre,
                'activo_e' => false
            ]);
            
            $usuario = new Usuario;
            $usuario->correo = str_random(10).'@gmail.com';
            $usuario->password = bcrypt('secret');
            $usuario->username = str_random(10);
            $entidad->usuario()->save($usuario);

            DB::table('usuario_perfil')->insert([
                'id_usuario' => $usuario->id_e,
                'id_perfil' => 3,
            ]);
        }
    }
}

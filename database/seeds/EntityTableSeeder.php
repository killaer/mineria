<?php

use Illuminate\Database\Seeder;
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
            $nro = rand(1,3);
            $counter = Entidad::where('tipo_e', $nro)->count() + 1;
            $nombre = (string) ($this->type[$nro].'_'. $counter);
            $entidad = Entidad::create([
                'tipo_e' => $nro,
                'cod_e' => $nombre,
                'activo_e' => false
            ]);
            if($nro == 3){
                $usuario = new Usuario;
                $usuario->correo = str_random(10).'@gmail.com';
                $usuario->password = bcrypt('secret');
                $usuario->username = str_random(10);
                $entidad->usuarios()->save($usuario);
            }
        }
    }

    public $type = [
        1 => 'MAQUINA',
        2 => 'LOCACION',
        3 => 'USUARIO'
    ];
}

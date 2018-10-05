<?php

namespace App\Traits;

use Illuminate\Http\Request;
use App\Location;
use App\Entidad;

trait SaverTools
{

    /**
     * Guardar la locacion
     */
    public function saveLocation(array $data)
    {
        $entidad = $this->createEntity(['key' => 3,'value' => 'locacion']);
        $entidad->locacion()->create([
            'nombre' => $data['name'],
            'cod_location' => $data['code'],
            'descripcion' => $data['desc'],
        ]);
    }

    /**
     * Metodo para crear las entidades dinamicamente
     * @param array $type
     * @return object $entity
     */
    private function createEntity(array $type){
        
        $counter = Entidad::where('tipo_e', $type['key'])->count() + 1;
        
        $name = strtoupper($type['value']).'_'. $counter;

        return Entidad::create([
            'tipo_e' => $type['key'],
            'cod_e' => $name,
            'activo_e' => true,
        ]);
    }
}
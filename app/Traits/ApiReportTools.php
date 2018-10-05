<?php

namespace App\Traits;

use Illuminate\Http\Request;
use App\Exceptions\ReportLoaderException;
use App\Events\ReportSubmitted;
use Illuminate\Support\Facades\Validator;

trait ApiReportTools
{

    /**
     * Verificar que toda la data del request
     * esta cubierta por una llave 'data'
     * @param Request $request
     * @return Exception 
     * @return void
     */
    public function hasRightFormat(Request $request)
    {
        if(!$request->data){
            throw new ReportLoaderException('Formato del archivo incorrecto');
        }

        $this->data = (array) json_decode($request->data);
    }

    /**
     * Realizar procesamientos de validacion y captura de eventos
     * en una sola iteración
     * @return Exception 
     * @return void
     */
    public function mainProcess()
    {
        //Validar que la primera capa de abstracción es correcta
        $this->validateFirstCap();

        //Globalizar la locacion de procedencia
        $this->location = $this->data['id_e_locacion'];

        //Obtener la información de los workers
        $abstraction['v1'] = (array) $this->data['workers_info'];

        /**
         * Iterar todos los workers
         * @var int $key - Posicion del Worker
         * @var array $singleWorker
         */
        foreach($abstraction['v1'] as $key => $singleWorker){
            
            //Se validan los campos del worker en $this->worker_requirements
            $hasChains = $this->validateSingleWorker($singleWorker, $key);

            #TODO: Verificar que la maquina ya esta registrada en esa locación, en caso contrario, disparar evento de nueva maquina.
            #TODO: Disparar evento de modificaciones, si el hostname es diferente o la MAC es diferente.
            #TODO: Verificar si falta reporte de alguna de las chains, si tiene

            if($hasChains){
                $this->validateSingleWorkerChains($singleWorker->workers_chain_info, [
                    'MAC' => $abstraction['v1'][$key]->mac_address, 
                    'HOSTNAME' => $abstraction['v1'][$key]->hostname
                ]);
            }
        }

    }

    /**
     * Valida que las chains tienen los campos correctos
     * @param array $info [MAC, HOSTNAME]
     * @param object $singleWorker
     * @param int $key
     */
    public function validateSingleWorkerChains(array $singleWorkerChains, array $info){
        /**
         * Iterar todos las chain de un worker
         * @var int $key
         * @var array $chain
         */
        foreach($singleWorkerChains as $key => $chain){

            $validateChain = Validator::make((array) $chain, $this->worker_chain_requirements);

            if($validateChain->fails()){
                throw new ReportLoaderException(
                    "Existen llaves erroneas en el chain nro: [$key]  del worker: [MAC: ".$info['MAC'].", HOSTNAME: ". $info['HOSTNAME']."], [".json_encode($validateChain->messages())."]"
                );
            }

            #TODO: Verificar que la cantidad de chains es la misma

            //Almacenar la información de cada uno
        }
    }

    /**
     * Valida que los workers tengan todos los campos correctos
     * @param array $info [MAC, HOSTNAME]
     * @param object $singleWorker
     * @param int $key
     */
    private function validateSingleWorker($singleWorker, $key){
        $singleWorker_validation = Validator::make(
            (array) $singleWorker, 
            $this->worker_requirements
        );

        if($singleWorker_validation->fails()){
            throw new ReportLoaderException(
                "Existen llaves erroneas en el worker: [$key]"
            );
        }
        return (!empty($singleWorker->workers_chain_info));
    }

    /**
     * Validar la primera capa de abstracción del documento
     */
    private function validateFirstCap(){
        $validateFile = Validator::make($this->data, $this->requirements);
        
        //No se cumple con los parametros de $this->requirements
        if($validateFile->fails()){
            throw new ReportLoaderException('El archivo JSON esta mal formateado');
        }

        //No existe información de los workers
        if(empty($this->data['workers_info'])){
            throw new ReportLoaderException('No se ha cargado información de los workers');
        }
    }

    /**
     * Lanzar el evento en el canal de autenticacion del socket
     * @return Exception 
     * @return void
     */
    public function triggerBroadcastEvent(Request $request)
    {
        return new ReportSubmittedEvent(
            $this->data->fecha_ms, 
            $this->data->id_e_locacion
        );
    }
}
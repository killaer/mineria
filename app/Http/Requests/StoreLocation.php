<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;

class StoreLocation extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        try {

            if(!Auth::check())
            {
                throw new \Exception();
            }

            if(!\App\Traits\SessionTools::isAdmin())
            {
                throw new \Exception();
            }

            return true;
            
        } catch(\Exception $e) {
            return false;
        }
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|string',
            'code' => 'required|numeric|unique:location,cod_location',
            'desc' => 'required|string',
        ];
    }
}

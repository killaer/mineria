<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ApiController extends Controller
{
    public function readReport(Request $request){
        dd($request->all());
    }
}
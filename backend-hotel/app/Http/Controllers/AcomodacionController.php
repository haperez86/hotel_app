<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Acomodacion;

class AcomodacionController extends Controller
{
    public function index()
    {
        $acomodaciones = Acomodacion::all();
        return response()->json($acomodaciones);
    }
}

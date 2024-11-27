<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TipoHabitacion;

class TipoHabitacionController extends Controller
{
    public function index()
    {
        $tipos = TipoHabitacion::all();
        return response()->json($tipos);
    }
}

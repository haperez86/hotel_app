<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hotel;

class HotelController extends Controller
{
    public function index()
    {
        $hoteles = Hotel::all();
        return response()->json($hoteles);
    }

    public function show($hotelId)
    {
        $hotel = Hotel::with(['habitaciones.tipo', 'habitaciones.acomodacion'])->find($hotelId);

        if (!$hotel) {
            return response()->json(['message' => 'Hotel no encontrado'], 404);
        }

        return response()->json($hotel);
    }
    
    public function store(Request $request)
    {
        // Validar los datos de entrada
        $request->validate([
            'nombre' => 'required|string|max:100',
            'direccion' => 'required|string|max:100',
            'ciudad' => 'required|string|max:100',
            'nit' => 'required|string|max:20', // El tamaño del NIT puede variar
            'num_habitaciones' => 'required|integer|min:1',
        ]);

        // Verificar si el NIT ya existe
        $existingHotel = Hotel::where('nit', $request->nit)->first();

        if ($existingHotel) {
            return response()->json(['message' => 'El NIT ya está registrado en otro hotel.'], 400);
        }

        // Si no hay duplicados, crear el hotel
        $hotel = Hotel::create($request->all());
        return response()->json($hotel, 201);
    }

    public function update(Request $request, $id)
    {
        $hotel = Hotel::findOrFail($id);

        $request->validate([
            'nombre' => 'sometimes|required|string|max:100',
            'direccion' => 'sometimes|required|string|max:100',
            'ciudad' => 'sometimes|required|string|max:100',
            'nit' => 'sometimes|required|string|unique:hoteles,nit,' . $hotel->id,
            'num_habitaciones' => 'sometimes|required|integer|min:1',
        ]);

        $hotel->update($request->all());
        return response()->json($hotel);
    }

    public function destroy($id)
    {
        $hotel = Hotel::findOrFail($id);
        $hotel->delete();
        return response()->json(['message' => 'Hotel eliminado con éxito']);
    }
}

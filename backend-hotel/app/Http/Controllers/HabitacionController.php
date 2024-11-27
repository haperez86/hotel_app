<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hotel;
use App\Models\Habitacion;
use App\Models\TipoHabitacion;
use App\Models\Acomodacion;

use Illuminate\Validation\Rule;

class HabitacionController extends Controller
{
    public function store(Request $request, $hotelId)
    {
        try {
            // Buscar el hotel
            $hotel = Hotel::findOrFail($hotelId);

            // Validar la entrada del usuario
            $request->validate([
                'tipo_id' => 'required|exists:tipos_habitacion,id',
                'acomodacion_id' => 'required|exists:acomodaciones,id',
                'numero' => [
                    'required',
                    'integer',
                    'min:1',
                    // Validación de unicidad dentro del mismo hotel
                    Rule::unique('habitaciones')->where(function ($query) use ($hotelId) {
                        return $query->where('hotel_id', $hotelId);
                    }),
                ],
            ]);

            // Validar si ya existe una habitación con la misma combinación de tipo y acomodación en el hotel
            $habitacionExistente = Habitacion::where('hotel_id', $hotelId)
                ->where('tipo_id', $request->tipo_id)
                ->where('acomodacion_id', $request->acomodacion_id)
                ->exists();

            if ($habitacionExistente) {
                return response()->json([
                    'error' => "Ya existe una habitación con el tipo de habitación y acomodación seleccionados para este hotel.",
                ], 422);
            }

            // Sumar los números actuales de las habitaciones para este hotel
            $sumaActualNumeros = Habitacion::where('hotel_id', $hotel->id)->sum('numero');

            // Calcular la nueva suma incluyendo el número de habitación actual
            $nuevaSuma = $sumaActualNumeros + $request->numero;

            // Validar si la nueva suma excede el límite de habitaciones del hotel
            if ($nuevaSuma > $hotel->num_habitaciones) {
                return response()->json([
                    'error' => "El hotel '{$hotel->nombre}' no puede exceder el total de habitaciones permitidas ({$hotel->num_habitaciones}). La suma actual sería {$nuevaSuma}, lo cual supera el límite.",
                ], 422);
            }

            // Crear la habitación
            Habitacion::create([
                'hotel_id' => $hotel->id,
                'tipo_id' => $request->tipo_id,
                'acomodacion_id' => $request->acomodacion_id,
                'numero' => $request->numero,
            ]);

            return response()->json(['success' => 'Habitación asignada exitosamente'], 201);
        } catch (\Throwable $th) {
            return response()->json([
                'error' => 'Ocurrió un error al procesar la solicitud',
                'message' => $th->getMessage(),
            ], 500);
        }
    }

    /**
     * Valida si una acomodación es válida para un tipo de habitación.
     *
     * @param string $tipoNombre
     * @param string $acomodacionNombre
     * @throws \Illuminate\Http\JsonResponse
     */
    private function validateAcomodacion($tipoNombre, $acomodacionNombre)
    {
        $reglas = [
            'Estándar' => ['Sencilla', 'Doble'],
            'Junior' => ['Triple', 'Cuádruple'],
            'Suite' => ['Sencilla', 'Doble', 'Triple'],
        ];

        if (!isset($reglas[$tipoNombre]) || !in_array($acomodacionNombre, $reglas[$tipoNombre])) {
            abort(422, "La acomodación '$acomodacionNombre' no es válida para el tipo de habitación '$tipoNombre'.");
        }
    }
}

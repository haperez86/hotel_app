<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Habitacion extends Model
{
    protected $table = 'habitaciones';
    
    // Definir los campos que se pueden asignar masivamente
    protected $fillable = [
        'hotel_id',
        'tipo_id',
        'acomodacion_id',
        'cantidad',
        'numero',
    ];

    /**
     * Relación con el modelo Hotel
     */
    public function hotel()
    {
        return $this->belongsTo(Hotel::class); // Una habitación pertenece a un hotel
    }

    /**
     * Relación con el modelo TipoHabitacion
     */
    public function tipo()
    {
        return $this->belongsTo(TipoHabitacion::class, 'tipo_id'); // Una habitación tiene un tipo
    }

    /**
     * Relación con el modelo Acomodacion
     */
    public function acomodacion()
    {
        return $this->belongsTo(Acomodacion::class, 'acomodacion_id'); // Una habitación tiene una acomodación
    }
}

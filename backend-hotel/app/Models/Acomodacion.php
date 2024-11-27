<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Acomodacion extends Model
{
    // Nombre de la tabla
    protected $table = 'acomodaciones';

    protected $fillable = ['hotel_id', 'tipo_id', 'acomodacion_id', 'numero'];

    public function habitaciones()
    {
        return $this->hasMany(Habitacion::class); // Una acomodación tiene muchas habitaciones
    }
}


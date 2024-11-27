<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoHabitacion extends Model
{
    // Especificar el nombre correcto de la tabla
    protected $table = 'tipos_habitacion'; 

    public function habitaciones()
    {
        return $this->hasMany(Habitacion::class); // Un tipo de habitación tiene muchas habitaciones
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hotel extends Model
{
    use HasFactory;

    /**
     * Nombre de la tabla en la base de datos.
     */
    protected $table = 'hoteles';

    /**
     * Campos que pueden ser asignados masivamente.
     */
    protected $fillable = [
        'nombre',
        'direccion',
        'ciudad',
        'nit',
        'num_habitaciones',
    ];

    public function habitaciones()
    {
        return $this->hasMany(Habitacion::class); // Un hotel tiene muchas habitaciones
    }
}

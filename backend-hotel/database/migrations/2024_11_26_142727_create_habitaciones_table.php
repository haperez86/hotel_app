<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('habitaciones', function (Blueprint $table) {
            $table->id();
            $table->foreignId('hotel_id')->constrained('hoteles')->onDelete('cascade'); // Relación con Hoteles
            $table->foreignId('tipo_id')->constrained('tipos_habitacion')->onDelete('cascade'); // Relación con Tipos de Habitación
            $table->foreignId('acomodacion_id')->constrained('acomodaciones')->onDelete('cascade'); // Relación con Acomodaciones
            $table->integer('numero')->nullable(); // Número de la habitación (opcional)
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('habitaciones');
    }
};

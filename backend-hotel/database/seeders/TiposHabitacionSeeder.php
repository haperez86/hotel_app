<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB; // Asegúrate de que esta línea esté incluida

class TiposHabitacionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipos_habitacion')->insert([
            ['nombre' => 'Estándar'],
            ['nombre' => 'Junior'],
            ['nombre' => 'Suite'],
        ]);
    }
}

import React, { useState, useEffect } from 'react';
import axios from 'axios';

const Habitaciones = ({ hotelId }) => {
  const [habitaciones, setHabitaciones] = useState([]);
  const [nuevaHabitacion, setNuevaHabitacion] = useState({
    tipo_id: '',
    acomodacion_id: '',
    numero: '',
  });

  useEffect(() => {
    // Obtener las habitaciones para un hotel específico
    axios
      .get(`http://127.0.0.1:8000/api/hoteles/${hotelId}/habitaciones`)
      .then((response) => setHabitaciones(response.data))
      .catch((error) => console.error('Error fetching habitaciones:', error));
  }, [hotelId]);

  const handleCrearHabitacion = (e) => {
    e.preventDefault();
    axios
      .post(`http://127.0.0.1:8000/api/hoteles/${hotelId}/habitaciones`, nuevaHabitacion)
      .then((response) => {
        setHabitaciones([...habitaciones, response.data]);
        setNuevaHabitacion({ tipo_id: '', acomodacion_id: '', numero: '' });
      })
      .catch((error) => console.error('Error creando habitación:', error.response.data.message));
  };

  return (
    <div className="p-4">
      <h2 className="text-2xl font-bold">Habitaciones del Hotel</h2>
      <ul className="mt-4">
        {habitaciones.map((habitacion) => (
          <li key={habitacion.id} className="mb-2">
            <span>
              Número: {habitacion.numero}, Tipo: {habitacion.tipo.nombre}, Acomodación:{' '}
              {habitacion.acomodacion.nombre}
            </span>
          </li>
        ))}
      </ul>
      <form onSubmit={handleCrearHabitacion} className="mt-4">
        <h3 className="text-xl font-bold">Nueva Habitación</h3>
        <input
          type="text"
          placeholder="ID Tipo"
          value={nuevaHabitacion.tipo_id}
          onChange={(e) => setNuevaHabitacion({ ...nuevaHabitacion, tipo_id: e.target.value })}
          className="border p-2 m-2"
        />
        <input
          type="text"
          placeholder="ID Acomodación"
          value={nuevaHabitacion.acomodacion_id}
          onChange={(e) => setNuevaHabitacion({ ...nuevaHabitacion, acomodacion_id: e.target.value })}
          className="border p-2 m-2"
        />
        <input
          type="text"
          placeholder="Número"
          value={nuevaHabitacion.numero}
          onChange={(e) => setNuevaHabitacion({ ...nuevaHabitacion, numero: e.target.value })}
          className="border p-2 m-2"
        />
        <button type="submit" className="bg-teal-600 text-white px-4 py-2">
          Agregar Habitación
        </button>
      </form>
    </div>
  );
};

export default Habitaciones;

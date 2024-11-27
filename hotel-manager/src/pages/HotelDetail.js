import React, { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom"; // Importa useNavigate
import AddRoomForm from "../components/AddRoomForm"; // Importa el formulario para agregar habitaciones

function HotelDetail() {
  const [hotel, setHotel] = useState(null);
  const [rooms, setRooms] = useState([]); // Iniciar con un arreglo vacío
  const hotelId = window.location.pathname.split("/")[2]; // Extraer el ID del hotel desde la URL
  const navigate = useNavigate(); // Hook para navegar entre páginas

  useEffect(() => {
    // Llamada a la API para obtener los detalles del hotel
    axios
      .get(`http://127.0.0.1:8000/api/hoteles/${hotelId}`) // Ajusta la URL de la API
      .then((response) => {
        setHotel(response.data); // Establece los datos del hotel
        setRooms(response.data.habitaciones || []); // Asegúrate de que habitaciones esté presente
      })
      .catch((error) => {
        console.error("Error fetching hotel details:", error);
        setRooms([]); // En caso de error, asegúrate de que rooms no sea undefined
      });
  }, [hotelId]);

  return hotel ? (
    <div className="container mx-auto p-6 bg-white shadow-md rounded-lg">
      {/* Botón para regresar al inicio */}
      <button
        onClick={() => navigate("/")} // Redirige al home
        className="bg-teal-600 text-white font-bold py-2 px-4 rounded mb-4 hover:bg-teal-800"
      >
        Regresar al Home
      </button>

      {/* Sección de información del hotel */}
      <div className="p-5 border-b border-gray-200">
        <h1 className="text-3xl font-bold text-teal-600">{hotel.nombre}</h1>
        <p className="mt-3 text-gray-700">
          <span className="font-semibold">Dirección:</span> {hotel.direccion}
        </p>
        <p className="mt-2 text-gray-700">
          <span className="font-semibold">Ciudad:</span> {hotel.ciudad}
        </p>
        <p className="mt-2 text-gray-700">
          <span className="font-semibold">NIT:</span> {hotel.nit}
        </p>
        <p className="mt-2 text-gray-700">
          <span className="font-semibold">Número de Habitaciones:</span>{" "}
          {hotel.num_habitaciones}
        </p>
      </div>

      {/* Agregar formulario para nuevas habitaciones */}
      <AddRoomForm hotelId={hotelId} />

      <div className="mt-6">
        <h3 className="text-xl font-semibold text-teal-600 border-b border-gray-200 pb-3">
          Asignación de Habitaciones
        </h3>
        <table className="min-w-full mt-4 table-auto border-collapse bg-white shadow-md rounded-lg">
          <thead>
            <tr className="bg-teal-600 text-white">
              <th className="border border-gray-300 px-6 py-3 text-left font-medium">
                Cantidad
              </th>
              <th className="border border-gray-300 px-6 py-3 text-left font-medium">
                Tipo de Habitación
              </th>
              <th className="border border-gray-300 px-6 py-3 text-left font-medium">
                Acomodación
              </th>
            </tr>
          </thead>
          <tbody>
            {rooms.length > 0 ? (
              rooms.map((room) => (
                <tr key={room.id} className="hover:bg-gray-100">
                  <td className="border border-gray-300 px-6 py-3 text-gray-700">
                    {room.numero}
                  </td>
                  <td className="border border-gray-300 px-6 py-3 text-gray-700">
                    {room.tipo.nombre}
                  </td>
                  <td className="border border-gray-300 px-6 py-3 text-gray-700">
                    {room.acomodacion.nombre}
                  </td>
                </tr>
              ))
            ) : (
              <tr>
                <td
                  colSpan="3"
                  className="border border-gray-300 px-6 py-3 text-center text-gray-500"
                >
                  No hay habitaciones asignadas.
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
  ) : (
    <p>Cargando...</p>
  );
}

export default HotelDetail;

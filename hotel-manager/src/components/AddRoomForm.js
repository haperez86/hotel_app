import React, { useState, useEffect } from "react";
import axios from "axios";

const AddRoomForm = ({ hotelId }) => {
  const [formData, setFormData] = useState({
    tipo_id: "",
    acomodacion_id: "",
    numero: "",
  });

  const [roomTypes, setRoomTypes] = useState([]); // Tipos de habitaciones
  const [acomodaciones, setAcomodaciones] = useState([]); // Acomodaciones
  const [successMessage, setSuccessMessage] = useState("");
  const [errorMessage, setErrorMessage] = useState("");

  useEffect(() => {
    // Llamadas a la API para cargar datos de tipos de habitación y acomodaciones
    axios
      .get("https://backend-laravel-production-664f.up.railway.app/api/tipos-habitacion")
      .then((response) => setRoomTypes(response.data))
      .catch((error) =>
        console.error("Error al cargar los tipos de habitación:", error)
      );

    axios
      .get("https://backend-laravel-production-664f.up.railway.app/api/acomodaciones")
      .then((response) => setAcomodaciones(response.data))
      .catch((error) =>
        console.error("Error al cargar las acomodaciones:", error)
      );
  }, []);

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post(
        `https://backend-laravel-production-664f.up.railway.app/api/hoteles/${hotelId}/habitaciones`,
        formData
      );
      setSuccessMessage("Habitación agregada exitosamente.");
      setErrorMessage("");
      setFormData({ tipo_id: "", acomodacion_id: "", numero: "" }); // Limpia el formulario
    } catch (error) {
      setSuccessMessage("");
      if (error.response && error.response.data.error) {
        // Captura el mensaje de error específico del backend
        setErrorMessage(error.response.data.error);
      } else {
        setErrorMessage("Error al agregar la habitación. Intenta de nuevo.");
      }
    }
  };

  return (
    <div className="bg-white p-5 rounded-lg shadow-lg">
      <h3 className="text-xl font-semibold mb-4 text-teal-600">
        Agregar Nueva Habitación
      </h3>
      <form onSubmit={handleSubmit}>
        {/* Selector de Tipo de Habitación */}
        <div className="mb-4">
          <label className="block text-gray-700 text-sm font-bold mb-2">
            Tipo de Habitación
          </label>
          <select
            name="tipo_id"
            value={formData.tipo_id}
            onChange={handleChange}
            className="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="">Seleccione un tipo</option>
            {roomTypes.map((tipo) => (
              <option key={tipo.id} value={tipo.id}>
                {tipo.nombre}
              </option>
            ))}
          </select>
        </div>

        {/* Selector de Acomodación */}
        <div className="mb-4">
          <label className="block text-gray-700 text-sm font-bold mb-2">
            Acomodación
          </label>
          <select
            name="acomodacion_id"
            value={formData.acomodacion_id}
            onChange={handleChange}
            className="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="">Seleccione una acomodación</option>
            {acomodaciones.map((acomodacion) => (
              <option key={acomodacion.id} value={acomodacion.id}>
                {acomodacion.nombre}
              </option>
            ))}
          </select>
        </div>

        {/* Campo para Número de Habitaciones */}
        <div className="mb-4">
          <label className="block text-gray-700 text-sm font-bold mb-2">
            Número de Habitaciones
          </label>
          <input
            type="number"
            name="numero"
            value={formData.numero}
            onChange={handleChange}
            placeholder="Cantidad de habitaciones"
            className="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
          />
        </div>

        <button
          type="submit"
          className="bg-teal-600 hover:bg-teal-900 text-white font-bold py-2 px-4 rounded w-full"
        >
          Guardar Habitación
        </button>

        {/* Mostrar mensajes de éxito o error */}
        {successMessage && (
          <p className="mt-4 text-green-500 text-sm">{successMessage}</p>
        )}
        {errorMessage && (
          <p className="mt-4 text-red-500 text-sm">{errorMessage}</p>
        )}
      </form>
    </div>
  );
};

export default AddRoomForm;

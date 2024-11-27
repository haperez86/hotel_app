import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import axios from 'axios';

function HotelForm() {
  const [formData, setFormData] = useState({
    name: '',
    address: '',
    city: '',
    nit: '',
    num_habitaciones: '', // Nuevo campo
  });

  const navigate = useNavigate();

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      // Realizar la solicitud POST a la API
      const response = await axios.post('http://127.0.0.1:8000/api/hoteles', {
        nombre: formData.name,
        direccion: formData.address,
        ciudad: formData.city,
        nit: formData.nit,
        num_habitaciones: formData.num_habitaciones,
      });
      console.log('Hotel creado:', response.data);
  
      // Navegar a la lista de hoteles después de crear el hotel
      navigate('/');
    } catch (error) {
      if (error.response && error.response.status === 400) {
        // Mostrar mensaje de error si el NIT ya está registrado
        alert(error.response.data.message || 'Error al crear el hotel');
      } else {
        console.error('Error al crear el hotel:', error.response || error);
      }
    }
  };

  return (
    <body className="min-h-100 bg-gray-200">
      <div className="md:flex min-h-screen md:align-top">
        <aside className="md:w-2/5 lg:w-2/5 xl:w-1/5 bg-teal-600 px-5 py-10">
          <h1 className="uppercase text-white tracking-wide text-2xl font-bold mt-2">
            HOTELES DECAMERON DE COLOMBIA
          </h1>
          <p className="mt-10 text-white">Sistema de Administracion Hoteles </p>
          <nav className="mt-8">
            <Link
              to="/"
              className="px-3 py-1 text-white block hover:bg-teal-700 hover:text-yellow-400"
            >
              Hoteles
            </Link>
            <Link
              to="/nuevo-hotel"
              className="px-3 py-1 text-white block hover:bg-teal-900 mt-2 hover:text-yellow-400 bg-teal-700"
            >
              Nuevo Hotel
            </Link>
          </nav>
        </aside>
        <main className="md:w-3/5 xl:w-4/5 px-5 py-10 bg-gray-200">
          <h2 className="text-3xl font-light text-center">Nuevo Hotel</h2>
          <div className="flex flex-col mt-10 items-center">
            <div className="-my-2 py-2 overflow-x-auto sm:-mx-6 sm:px-6 lg:-mx-8 lg:px-8 w-10/12 md:w-8/12 lg:w-6/12">
              <div className="shadow overflow-hidden sm:rounded-lg border-b border-gray-200">
                <form
                  id="formulario"
                  className="bg-white p-3"
                  onSubmit={handleSubmit}
                >
                  <div className="mb-4">
                    <label className="block text-gray-700 text-sm font-bold mb-2">
                      Nombre del Hotel
                    </label>
                    <input
                      className="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                      type="text"
                      name="name"
                      placeholder="Nombre Hotel"
                      value={formData.name}
                      onChange={handleChange}
                    />
                  </div>
                  <div className="mb-4">
                    <label className="block text-gray-700 text-sm font-bold mb-2">
                      Dirección
                    </label>
                    <input
                      className="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                      type="text"
                      name="address"
                      value={formData.address}
                      onChange={handleChange}
                      placeholder="Dirección"
                    />
                  </div>
                  <div className="mb-4">
                    <label className="block text-gray-700 text-sm font-bold mb-2">
                      Ciudad
                    </label>
                    <input
                      className="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                      type="text"
                      name="city"
                      value={formData.city}
                      onChange={handleChange}
                      placeholder="Ciudad"
                    />
                  </div>
                  <div className="mb-4">
                    <label className="block text-gray-700 text-sm font-bold mb-2">
                      NIT
                    </label>
                    <input
                      className="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                      type="text"
                      name="nit"
                      value={formData.nit}
                      onChange={handleChange}
                      placeholder="Nit"
                    />
                  </div>
                  <div className="mb-4">
                    <label className="block text-gray-700 text-sm font-bold mb-2">
                      Número de Habitaciones
                    </label>
                    <input
                      className="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                      type="number"
                      name="num_habitaciones"
                      value={formData.num_habitaciones}
                      onChange={handleChange}
                      placeholder="Número de Habitaciones"
                    />
                  </div>
                  <button
                    className="bg-teal-600 hover:bg-teal-900 w-full mt-5 p-2 text-white uppercase font-bold"
                    type="submit"
                  >
                    Guardar
                  </button>
                </form>
              </div>
            </div>
          </div>
        </main>
      </div>
    </body>
  );
}

export default HotelForm;

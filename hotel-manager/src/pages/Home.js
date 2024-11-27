import React, { useState, useEffect } from 'react';
import axios from 'axios';
import HotelList from '../components/HotelList';
import HotelForm from '../components/HotelForm';
import { Link } from 'react-router-dom';

function Home() {
  const [hotels, setHotels] = useState([]);

  useEffect(() => {
    // Llamada a la API para obtener la lista de hoteles
    axios
      .get('http://127.0.0.1:8000/api/hoteles/') // Cambiar esta URL por la de tu backend
      .then((response) => setHotels(response.data))
      .catch((error) => console.error('Error fetching hotels:', error));
  }, []);

  return (
    <body class="min-h-100 bg-gray-200">
      <div class="md:flex min-h-screen md:align-top">
        <aside class="md:w-2/5 lg:w-2/5 xl:w-1/5 bg-teal-600 px-5 py-10">
          <h1 class="uppercase text-white tracking-wide text-2xl  font-bold mt-2">HOTELES DECAMERON DE COLOMBIA</h1>
          <p class="mt-10 text-white">Sistema de Administracion Hoteles </p>
              <nav className="mt-8">
              <Link
                to="/"
                className="px-3 py-1 text-white block hover:bg-teal-700 hover:text-yellow-400 bg-teal-700"
              >
                Hoteles
              </Link>
              <Link
                to="/nuevo-hotel"
                className="px-3 py-1 text-white block hover:bg-teal-900 mt-2 hover:text-yellow-400"
              >
                Nuevo Hotel
              </Link>
            </nav>
        </aside>
          <HotelList hotels={hotels} />
      </div>
    </body>
  );
}

export default Home;

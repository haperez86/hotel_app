import React from 'react';

function HotelList({ hotels }) {
  return (

    <main class="md:w-3/5  xl:w-4/5 px-5 py-10 bg-gray-200">
        <h2 class="text-3xl font-light text-center">Hoteles</h2>

          <div class="flex flex-col mt-10">
            <div class="py-2 overflow-x-auto">
              <div class="align-middle inline-block min-w-full shadow overflow-hidden sm:rounded-lg border-b border-gray-200">
                <table class="min-w-full">
                    <thead class="bg-gray-100 ">
                        <tr>
                            <th class="px-6 py-3 border-b border-gray-200  text-left text-xs leading-4 font-medium text-gray-600 uppercase tracking-wider">
                                    Nombre Hotel
                            </th>
                            <th class="px-6 py-3 border-b border-gray-200  text-left text-xs leading-4 font-medium text-gray-600 uppercase tracking-wider">
                                    Direccion
                            </th>
                            <th class="px-6 py-3 border-b border-gray-200  text-left text-xs leading-4 font-medium text-gray-600 uppercase tracking-wider">
                                    Ciudad
                            </th>
                            <th class="px-6 py-3 border-b border-gray-200  text-left text-xs leading-4 font-medium text-gray-600 uppercase tracking-wider">
                                    Nit
                            </th>
                            <th class="px-6 py-3 border-b border-gray-200  text-left text-xs leading-4 font-medium text-gray-600 uppercase tracking-wider">
                                  numero habitaciones
                            </th>
                            <th class="px-6 py-3 border-b border-gray-200  text-left text-xs leading-4 font-medium text-gray-600 uppercase tracking-wider">
                                  detalle
                            </th>
                        </tr>
                    </thead>
                    <tbody className="bg-white">
                        {hotels.map((hotel) => (
                        <tr key={hotel.id}>
                        <td className="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
                                <p className="text-sm leading-10 text-gray-700">{hotel.nombre}</p>
                        </td>
                        <td className="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
                                <p className="text-sm leading-5 font-medium text-gray-700">{hotel.direccion}</p>
                        </td>
                        <td className="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
                                <p className="text-sm leading-5 font-medium text-gray-700">{hotel.ciudad}</p>
                        </td>
                        <td className="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
                                <p className="text-sm leading-5 font-medium text-gray-700">{hotel.nit}</p>
                        </td>
                        <td className="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
                                <p className="text-sm leading-5 font-medium text-gray-700">{hotel.num_habitaciones}</p>
                        </td>
                        {/* Nueva columna para el botón de detalle */}
                        <td className="px-6 py-4 whitespace-no-wrap border-b border-gray-200">
                                <button
                                className="bg-teal-600 text-white px-4 py-2 rounded hover:bg-teal-800"
                                onClick={() => window.location.href = `/hotel/${hotel.id}`}
                                >
                                Ver
                                </button>
                        </td>
                        </tr>
                        ))}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
      </main>
      
  );
}

export default HotelList;

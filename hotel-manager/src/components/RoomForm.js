import React, { useState } from 'react';

function RoomForm({ hotelId, roomTypes }) {
  const [formData, setFormData] = useState({
    roomType: '',
    accommodation: '',
    quantity: 0,
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Aquí harías la llamada a la API para asignar la habitación
    console.log('Datos enviados:', formData, 'Hotel ID:', hotelId);
  };

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <label>Tipo de Habitación</label>
        <select
          name="roomType"
          value={formData.roomType}
          onChange={handleChange}
        >
          <option value="">Seleccione...</option>
          {roomTypes.map((type) => (
            <option key={type} value={type}>
              {type}
            </option>
          ))}
        </select>
      </div>
      <div>
        <label>Acomodación</label>
        <input
          type="text"
          name="accommodation"
          value={formData.accommodation}
          onChange={handleChange}
        />
      </div>
      <div>
        <label>Cantidad</label>
        <input
          type="number"
          name="quantity"
          value={formData.quantity}
          onChange={handleChange}
        />
      </div>
      <button type="submit">Guardar</button>
    </form>
  );
}

export default RoomForm;

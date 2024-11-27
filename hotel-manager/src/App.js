import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Home from './pages/Home';
import HotelDetail from './pages/HotelDetail';
import HotelForm from './components/HotelForm';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/hotel/:id" element={<HotelDetail />} />
        <Route path="/nuevo-hotel" element={<HotelForm />} />
      </Routes>
    </Router>
  );
}

export default App;

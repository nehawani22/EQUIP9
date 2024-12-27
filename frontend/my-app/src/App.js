import React from "react";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import RegistrationPage from "./RegistrationPage";
import LoginPage from "./LoginPage";
import LandingPage from "./LandingPage";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<RegistrationPage />} />
        <Route path="/login" element={<LoginPage />} />
        <Route path="/landing" element={<LandingPage />} />
      </Routes>
    </Router>
  );
}

export default App;
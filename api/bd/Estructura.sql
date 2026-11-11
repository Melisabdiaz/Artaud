-- ======================================
-- Pensión estudiantil - Azul
-- ======================================

CREATE DATABASE IF NOT EXISTS pension_azul CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE pension_azul;

-- ----------------------
-- Tabla: Admin/Dueño
-- ----------------------
CREATE TABLE IF NOT EXISTS dueno (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(255) NOT NULL,
  contrasena VARCHAR (100) NOT NULL,
  dni VARCHAR(20) NOT NULL,
  telefono VARCHAR(30)NOT NULL
);

-- ----------------------
-- Tabla: usuarios/inquilino
-- ----------------------
CREATE TABLE IF NOT EXISTS inquilino (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  email VARCHAR(120) UNIQUE NOT NULL,
  dni VARCHAR(20) UNIQUE NOT NULL,
  telefono VARCHAR(100) NOT NULL
);

-- ----------------------
-- Tabla: Cama
-- ----------------------
CREATE TABLE IF NOT EXISTS cama (
  id INT AUTO_INCREMENT PRIMARY KEY,
  numero_cama VARCHAR(100) NOT NULL,
  tipo VARCHAR(100) NOT NULL,
  habitacion VARCHAR(30) NOT NULL,
  estado VARCHAR(120) NOT NULL,
  precio INT
);


-- ----------------------
-- Tabla: Estadia
-- ----------------------
CREATE TABLE IF NOT EXISTS estadia (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fecha_creacion DATETIME NOT NULL,
  fecha_ingreso DATETIME NOT NULL,
  fecha_retiro DATETIME NOT NULL,
  estado VARCHAR(50) DEFAULT 'pendiente',
  cama_id INT,
  inquilino_id INT,
  codigo_reserva VARCHAR(50) UNIQUE NOT NULL,
  FOREIGN KEY (cama_id) REFERENCES cama(id),
  FOREIGN KEY (inquilino_id) REFERENCES inquilino(id)
);
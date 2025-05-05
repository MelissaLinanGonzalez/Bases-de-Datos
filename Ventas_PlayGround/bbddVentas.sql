-- Crear base de datos y usarla
CREATE DATABASE IF NOT EXISTS ventas;
USE ventas;

-- Crear tabla cliente
CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(50),
    categoria INT
);

-- Crear tabla comercial
CREATE TABLE comercial (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    comision DECIMAL(4,2)
);

-- Crear tabla pedido
CREATE TABLE pedido (
    id INT PRIMARY KEY,
    total DECIMAL(10,2) NOT NULL,
    fecha DATE NOT NULL,
    id_cliente INT,
    id_comercial INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id),
    FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

-- Insertar datos en cliente
INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES
(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100),
(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200),
(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL),
(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300),
(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200),
(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100),
(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300),
(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200),
(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225),
(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

-- Insertar datos en comercial
INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES
(1, 'Daniel', 'Sáez', 'Vega', 0.15),
(2, 'Juan', 'Gómez', 'López', 0.13),
(3, 'Diego', 'Flores', 'Salas', 0.11),
(4, 'Marta', 'Herrera', 'Gil', 0.14),
(5, 'Antonio', 'Carretero', 'Ortega', 0.12),
(6, 'Manuel', 'Domínguez', 'Hernández', 0.13),
(7, 'Antonio', 'Vega', 'Hernández', 0.11),
(8, 'Alfredo', 'Ruiz', 'Flores', 0.05);

-- Insertar datos en pedido
INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES
(1, 150.50, '2017-10-05', 5, 2),
(2, 270.65, '2016-09-10', 1, 5),
(3, 65.26, '2017-10-05', 2, 1),
(4, 110.50, '2016-08-17', 8, 3),
(5, 948.50, '2017-09-10', 5, 2),
(6, 2400.60, '2016-07-27', 7, 1),
(7, 5760.00, '2015-09-10', 2, 1),
(8, 1983.43, '2017-10-10', 4, 6),
(9, 2480.40, '2016-10-10', 8, 3),
(10, 250.45, '2015-06-27', 8, 2),
(11, 75.29, '2016-08-17', 3, 7),
(12, 3045.60, '2017-04-25', 2, 1),
(13, 545.75, '2019-01-25', 6, 1),
(14, 145.82, '2017-02-02', 6, 1),
(15, 370.85, '2019-03-11', 1, 5),
(16, 2389.23, '2019-03-11', 1, 5);

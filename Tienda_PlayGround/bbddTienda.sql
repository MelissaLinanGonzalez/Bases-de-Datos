DROP DATABASE IF EXISTS Tienda;
CREATE DATABASE Tienda;
USE Tienda;

CREATE TABLE fabricante (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO fabricante (id, nombre) VALUES
(1, 'Asus'),
(2, 'Lenovo'),
(3, 'Hewlett-Packard'),
(4, 'Samsung'),
(5, 'Seagate'),
(6, 'Crucial'),
(7, 'Gigabyte'),
(8, 'Huawei'),
(9, 'Xiaomi');

CREATE TABLE producto (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_fabricante INT NOT NULL,
    FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO producto (id, nombre, precio, id_fabricante) VALUES
(1, 'Disco duro SATA3 1TB', 86.99, 5),
(2, 'Memoria RAM DDR4 8GB', 120.00, 6),
(3, 'Disco SSD 1 TB', 150.99, 4),
(4, 'GeForce GTX 1050Ti', 185.00, 7),
(5, 'GeForce GTX 1080 Xtreme', 755.00, 6),
(6, 'Monitor 24 LED Full HD', 202.00, 1),
(7, 'Monitor 27 LED Full HD', 245.99, 1),
(8, 'Portátil Yoga 520', 559.00, 2),
(9, 'Portátil Ideapd 320', 444.00, 2),
(10, 'Impresora HP Deskjet 3720', 59.99, 3),
(11, 'Impresora HP Laserjet Pro M26nw', 180.00, 3);
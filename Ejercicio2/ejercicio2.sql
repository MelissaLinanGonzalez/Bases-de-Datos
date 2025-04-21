DROP DATABASE IF EXISTS Tienda;
CREATE DATABASE IF NOT EXISTS Tienda;

USE Tienda;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY, 
    nombre_producto VARCHAR(100) NOT NULL,      
    categoria VARCHAR(50) NOT NULL,             
    stock INT NOT NULL,                         
    precio_unitario DECIMAL(10, 2) NOT NULL     
);
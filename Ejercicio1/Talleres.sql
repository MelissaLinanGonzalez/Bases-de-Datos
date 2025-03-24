DROP DATABASE IF EXISTS Talleres;
CREATE DATABASE IF NOT EXISTS Talleres;
USE Talleres;

CREATE TABLE IF NOT EXISTS Coches (
    matricula VARCHAR(8) NOT NULL,
    marca VARCHAR(15),
    an_fab INT (4),
    modelo VARCHAR(15),
    PRIMARY KEY (matricula)
);

CREATE TABLE IF NOT EXISTS Mecanicos (
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(15),
    puesto VARCHAR(15),
    parcial BOOLEAN,
    PRIMARY KEY (dni)
);

CREATE TABLE IF NOT EXISTS Trabajos (
    matricula VARCHAR(8) NOT NULL,
    dni VARCHAR(9) NOT NULL,
    fecha DATE,
    horas DECIMAL(4,2) CHECK(horas > 0.5),
    PRIMARY KEY (matricula, dni),  
    FOREIGN KEY (matricula) REFERENCES Coches(matricula)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (dni) REFERENCES Mecanicos(dni)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente VARCHAR(10) NOT NULL,
    nombre VARCHAR(50),
    numeroTel VARCHAR(15),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE IF NOT EXISTS Piezas (
    id_pieza VARCHAR (15),
    nombre VARCHAR(50),
    precio DECIMAL(5,2),
    PRIMARY KEY (id_pieza)
);

CREATE TABLE IF NOT EXISTS Facturas (
    id_factura VARCHAR(10) NOT NULL,
    id_cliente VARCHAR(10) NOT NULL,
    fechaEmision DATE,
    total DECIMAL(5,2),
    PRIMARY KEY (id_factura, id_cliente), 
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

ALTER TABLE Coches
ALTER COLUMN an_fab SET DEFAULT 2020;
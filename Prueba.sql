CREATE DATABASE IF NOT EXISTS dragonball;
USE dragonball;

-- Crear la tabla guerreros_z
CREATE TABLE guerreros_z (
    id_guerrero INT PRIMARY KEY,
    nombre VARCHAR(50),
    raza VARCHAR(50),
    nivel_poder INT
);

-- Insertar datos en guerreros_z
INSERT INTO guerreros_z (id_guerrero, nombre, raza, nivel_poder) VALUES
(1, 'Goku', 'Saiyan', 9500),
(2, 'Vegeta', 'Saiyan', 9200),
(3, 'Gohan', 'Saiyan-mestizo', 8700),
(4, 'Piccolo', 'Namek', 7500),
(5, 'Krilin', 'Humano', 4000),
(6, 'Yamcha', 'Humano', NULL);

-- Crear la tabla tecnicas
CREATE TABLE tecnicas (
    id_tecnica INT PRIMARY KEY,
    nombre_tecnica VARCHAR(50),
    id_guerrero INT,
    FOREIGN KEY (id_guerrero) REFERENCES guerreros_z(id_guerrero)
);

-- Insertar datos en tecnicas
INSERT INTO tecnicas (id_tecnica, nombre_tecnica, id_guerrero) VALUES
(1, 'Kamehameha', 1),
(2, 'Genki-Dama', 1),
(3, 'Final Flash', 2),
(4, 'Big Bang Attack', 2),
(5, 'Masenko', 3),
(6, 'Makankosappo', 4),
(7, 'Destructo Disc', 5);

SELECT guerreros_z.nombre, tecnicas.nombre_tecnica
FROM guerreros_z, tecnicas 
WHERE guerreros_z.id_guerrero = tecnicas.id_guerrero;

SELECT g.nombre, t.nombre_tecnica 
FROM guerreros_z AS g, tecnicas AS t 
WHERE g.id_guerrero = t.id_guerrero;

SELECT * 
FROM guerreros_z AS g
JOIN tecnicas AS t
ON g.id_guerrero = t.id_guerrero;
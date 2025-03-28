DROP DATABASE IF EXISTS GuerrerosZ;
CREATE DATABASE IF NOT EXISTS GuerrerosZ;
USE GuerrerosZ;

CREATE TABLE IF NOT EXISTS Guerreros (
    id_guerrero INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    raza VARCHAR(30),
    nivel_poder INT,
    PRIMARY KEY (id_guerrero)
);

INSERT INTO Guerreros (nombre, raza, nivel_poder)
VALUES
    ('Goku', 'Saiyan', 9500),
    ('Vegeta', 'Saiyan', 9200),
    ('Gohan', 'Saiyan-mestizo', 8700),
    ('Piccolo', 'Namek', 7500),
    ('Krillin', 'Humano', 4000),
    ('Yamcha', 'Humano', NULL);

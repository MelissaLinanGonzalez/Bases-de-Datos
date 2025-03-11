DROP DATABASE IF EXISTS TorneosDragonBall;

CREATE DATABASE IF NOT EXISTS TorneosDragonBall;

USE TorneosDragonBall;

CREATE TABLE IF NOT EXISTS Torneos (
    id_torneo INT AUTO_INCREMENT,
    nombre VARCHAR (100) UNIQUE,
    ubicacion VARCHAR (100),
    fecha_inicio DATE,
    fecha_fin DATE NULL,
    PRIMARY KEY (id_torneo)
);

CREATE TABLE IF NOT EXISTS Participantes (
    id_participante INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    edad INT CHECK(edad >= 18 AND edad < 150),
    raza VARCHAR(30),
    id_torneo INT,
    PRIMARY KEY (id_participante),
    FOREIGN KEY (id_torneo) REFERENCES Torneos(id_torneo)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


INSERT INTO Torneos (nombre, ubicacion, fecha_inicio)
VALUES 
    ('Tenkaichi Budokai', 'Dojo Tenkaichi', '2025-03-07'),
    ('Torneo del Poder', 'Arena del Torneo del Poder', '2025-06-15'),
    ('Torneo del Otro Mundo', 'Otro Mundo', '2025-12-08');

INSERT INTO Participantes (nombre, edad, raza, id_torneo)
VALUES
    ('Goku', 30, 'Saiyajin', 1),
    ('Boo', 25, 'Extraterrestre', 2),
    ('Bills', 140, 'Dios de la Guerra', 3);

UPDATE Torneos
SET ubicacion = 'Dojo Profe'
WHERE ubicacion = 'Dojo Tenkaichi';
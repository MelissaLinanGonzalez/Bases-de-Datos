DROP DATABASE IF EXISTS CaballerosZodiaco;

CREATE DATABASE IF NOT EXISTS CaballerosZodiaco;

USE CaballerosZodiaco;

CREATE TABLE IF NOT EXISTS Constelaciones (
    ID INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(1000),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Caballeros_del_Zodiaco (
    ID INT AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    SignoZodiacal VARCHAR(50),
    ConstelacionID INT,
    PRIMARY KEY (id),
    FOREIGN KEY (ConstelacionID) REFERENCES Constelaciones(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT INTO Constelaciones (Nombre, Descripcion)
VALUES
    ('Pegaso', 'Una Constelación celestial en forma de caballo alado.'),
    ('Dragon', 'Una de las constelaciones más grandes y prominentes del cielo nocturno.'),
    ('Cisne', 'Representa a un cisne que vuela a lo largo de la Vía Láctea.'),
    ('Fenix', 'Un ave mítica que renace de sus propias cenizas.'),
    ('Andromeda', 'Una constelación que representa a la princesa de la mitología griega, encadenada a una roca como sacrificio.');


INSERT INTO Caballeros_del_Zodiaco (Nombre, SignoZodiacal, ConstelacionID)
VALUES
    ('Seiya', 'Sagitario', 1),
    ('Shiryu', 'Capricornio', 2),
    ('Hyoga', 'Acuario', 3),
    ('Ikki', 'Escorpio', 4),
    ('Shun', 'Piscis', 5);

ALTER TABLE Caballeros_del_Zodiaco
CHANGE COLUMN SignoZodiacal Zodiaco VARCHAR(50);

ALTER TABLE Constelaciones
ADD COLUMN Estrella_Principal VARCHAR(50);

RENAME TABLE Caballeros_del_Zodiaco TO Caballeros;

UPDATE Constelaciones
SET Descripcion = 'Andrómeda es una constelación del hemisferio norte, cerca del Polo Norte Celeste, conocida por su vínculo con la mitología griega y la galaxia de Andrómeda (M31), una de las más grandes y brillantes observables desde la Tierra.'
WHERE Descripcion = 'Una constelación que representa a la princesa de la mitología griega, encadenada a una roca como sacrificio.';

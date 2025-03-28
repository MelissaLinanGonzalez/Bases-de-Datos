DROP DATABASE IF EXISTS DBZ_Ejercicio_Calculos;
CREATE DATABASE IF NOT EXISTS DBZ_Ejercicio_Calculos;
USE DBZ_Ejercicio_Calculos;

CREATE TABLE IF NOT EXISTS Guerreros (
    id_guerrero INT AUTO_INCREMENT,
    nombre VARCHAR(50),
    raza VARCHAR(50),
    nivel_poder INT,
    cantidad_transformaciones INT,
    PRIMARY KEY (id_guerrero)
);

INSERT INTO Guerreros (nombre, raza, nivel_poder, cantidad_transformaciones)
VALUES
    ('Goku', 'Saiyan', 9500, 6),
    ('Vegeta', 'Saiyan', 9200, 4),
    ('Gohan', 'Saiyan', 8700, 4),
    ('Piccolo', 'Namekiano', 7500, 1),
    ('Trunks', 'Saiyan', 8600, 2),
    ('Freezer', 'Emperador del Mal', 9400, 5),
    ('Cell', 'Bio-Androide', 9100, 3),
    ('Majin Buu', 'Majin', 9300, 3),
    ('Goten', 'Saiyan', 8200, 1),
    ('Krilin', 'Humano', 4000, 0);

--Selecciona el noimbre  y el nivel de poder de los guerreros cuyo nivel de poder es mayor a 9000--
SELECT nombre, nivel_poder
FROM Guerreros
WHERE nivel_poder > 9000;

--Selecciona el nombre y la cantidad de transformaciones de los guerreros cuya cantidad de transformaciones sea menor o igual a 3--
SELECT nombre, cantidad_transformaciones
FROM Guerreros
WHERE cantidad_transformaciones <= 3;

--Calcula el poder total multiplicando el nivel de poder por la cantidad de transformaciones para cada guerrero--
--Evitando que los elementos que tengan cantidad_transformaciones = 0, se le asigne un poder_total = 0--
SELECT nombre,
    CASE
        WHEN cantidad_transformaciones > 0 THEN nivel_poder * cantidad_transformaciones
        ELSE nivel_poder
    END AS poder_total
FROM Guerreros;

--Selecciona el nombre, nivel de poder y cantidad de transformaciones y añade una columna adicional llamada estado_transformacion, que muestre "Super Saiyan" si la cantidad de transformaciones es mayor que 0 y son de raza Saiyan y "Sin Transformaciones" si la cantidad de transformaciones es igual a 0--
SELECT nombre, nivel_poder, cantidad_transformaciones,
    CASE
        WHEN raza = 'Saiyan' AND cantidad_transformaciones > 0 THEN '¡Super Saiyan!'
        WHEN cantidad_transformaciones = 0 THEN 'Sin transformaciones'
        ELSE 'Transformado'
    END AS estado_transformacion
FROM Guerreros;

--Utiliza la cláusula CASE WHEN ELSE para realizar la consulta d) y mostrar en la nueva columna el estado de transformación de todos los guerreros. Por ejemplo si es Piccolo, debe aparecer ‘Orange_Piccolo’, si es Freezer debe aparecer ‘Black_Freezer’.--
SELECT nombre, nivel_poder, cantidad_transformaciones,
    CASE
        WHEN nombre = 'Piccolo' THEN 'Orange_Piccolo'
        WHEN nombre = 'Freezer' THEN 'Black_Freezer'
        WHEN raza = 'Saiyan' AND cantidad_transformaciones > 0 THEN '¡Super Saiyan!'
        WHEN cantidad_transformaciones = 0 THEN 'Sin transformaciones'
        ELSE 'Transformado'
    END AS estado_transformacion
FROM Guerreros;
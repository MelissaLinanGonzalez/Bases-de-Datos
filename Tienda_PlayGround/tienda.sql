-- Consultas SENCILLAS

-- Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto;

-- Lista todas las columnas de la tabla producto.
SELECT * FROM prooducto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, (precio *1.15) FROM producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre, precio, (precio *1.15) AS dolar FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(nombre), precio FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(nombre), precio FROM producto;

-- Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT nombre, ROUND(precio) FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;

-- Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT id_fabricante FROM producto;

-- Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT id_fabricante FROM producto;

-- Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto WHERE id_fabricante = 2;

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto WHERE precio <= 120;

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE precio >=400;

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE precio < 400;

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT * FROM producto WHERE precio >= 80 AND precio <= 300;

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT * FROM producto WHERE precio BETWEEN 60 AND 200;

-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
SELECT * FROM producto WHERE precio > 200 AND id_fabricante = 6;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT * FROM producto WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM producto WHERE id_fabricante IN (1, 3, 5);

-- Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, (precio * 100) AS centimos FROM producto;

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante WHERE nombre LIKE '%e';

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante WHERE nombre LIKE '____';
SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto WHERE nombre LIKE '%portatil%';

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre FROM producto WHERE nombre LIKE '%monitor%' AND precio < 215;

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;

-- Composición INTERNA

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre, p.precio, f.nombre FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre, p.precio, f.nombre FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id ORDER BY f.nombre;

-- Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT p.id, p.nombre, f.id, f.nombre FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre, p.precio, f.nombre FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id ORDER BY precio ASC LIMIT 1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre, p.precio, f.nombre FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id ORDER BY precio DESC LIMIT 1;

-- Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre = 'Lenovo';

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT * FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT * FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT * FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre LIKE '%e';

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT * FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre LIKE '%w%';

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT * FROM producto AS p JOIN fabricante AS f on p-id_fabricante = f.id WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

-- Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT f.* FROM fabricante AS f JOIN producto AS p on p.id_fabricante = f.id;

-- COMPOSICIÓN EXTERNA

-- Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT * FROM fabricante AS f LEFT JOIN producto AS p on f.id = p.id_fabricante;

-- Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT * FROM fabricante AS f LEFT JOIN producto AS p on f.id = p.id_fabricante WHERE p.id IS NULL;

-- CONSULTAS RESUMEN

-- 1 Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(id) FROM producto;

-- 2 Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(id) FROM fabricante;

-- 3 Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT(id_fabricante)) FROM producto;

-- 4 Calcula la media del precio de todos los productos.
SELECT AVG(precio) FROM producto;

-- 5 Calcula el precio más barato de todos los productos.
SELECT MIN(precio) FROM producto;

-- 6 Calcula el precio más caro de todos los productos.
SELECT MAX(precio) FROM producto;

-- 7 ista el nombre y el precio del producto más barato.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 8 Lista el nombre y el precio del producto más caro.
SELECT nombre, precio FROM producto WHERE precio = (SELECT MAX(precio) FROM producto);

-- 9 Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) FROM producto;

-- 10 Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(p.id) FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre = 'Asus';

-- 11 Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(p.precio) FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre = 'Asus';

-- 12 Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(p.precio) FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre = 'Asus';

-- 13 Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(p.precio) FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre = 'Asus';

-- 14 Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(p.precio) FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre = 'Asus';

-- 15 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(p.id) FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id WHERE f.nombre = 'Crucial';

-- 16 Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT f.nombre, COUNT(p.id) FROM fabricante AS f LEFT JOIN producto AS p on f.id = p.id_fabricante GROUP BY f.nombre ORDER BY COUNT(p.id) DESC;

-- 17 Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio) FROM fabricante As f JOIN producto AS p on f.id = p.id_fabricante GROUP BY f.nombre;

-- 18 Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
SELECT f.id, MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(p.id) FROM fabricante as f JOIN producto AS p on f.id = p.id_fabricante GROUP BY f.id HAVING AVG(p.precio) > 200;

-- 19 Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(p.id) FROM fabricante as f JOIN producto AS p on f.id = p.id_fabricante GROUP BY f.nombre HAVING AVG(p.precio) > 200;

-- 20 Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(*) FORM producto WHERE precio >= 180;

-- 21 Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT f.nombre, COUNT(p.id) FROM fabricante AS f JOIN producto AS p on f.id = p.id_fabricante WHERE p.precio >= 180 GROUP BY f.nombre;

-- 22 Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
SELECT AVG(precio), id_fabricante FROM producto GROUP BY id_fabricante;

-- 23 Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT AVG(p.precio), f.nombre FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id GROUP BY f.nombre;

-- 24 Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT AVG(p.precio), f.nombre FROM producto AS p JOIN fabricante AS f on p.id_fabricante = f.id GROUP BY f.nombre HAVING AVG(p.precio) >= 150;

-- 25 Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT f.nombre, COUNT(p.id) FROM fabricante AS f JOIN producto AS p on f.id = p.id_fabricante GROUP BY f.nombre HAVING COUNT(p.id) >= 2;

-- 26 Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT f.nombre, COUNT(p.id) FROM fabricante AS f JOIN producto AS p on f.id = p.id_fabricante WHERE p.precio >= 220 GROUP BY f.nombre;

-- 27 Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT f.nombre, COUNT(CASE WHEN p.precio >= 220 THEN 1 ELSE NULL END) AS num_productos FROM fabricante AS f LEFT JOIN producto AS p ON f.id = p.id_fabricante GROUP BY f.nombre;

-- 28 Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
SELECT f.nombre, SUM(p.precio) FROM fabricante AS f JOIN producto AS p o f.id = p.id_fabricante GROUP BY f.nombre HAVING SUM(p.precio) > 1000;

-- 29 Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
SELECT f.nombre, p.nombre, p.precio FROM fabricante AS f JOIN producto AS p on f.id = p.id_fabricante WHERE p.precio = (SELECT MAX(precio) FROM producto WHERE id_fabricante = f.id) ORDER BY f.nombre;

-- SUBCONSULTAS

-- 1 Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT *
FROM producto
WHERE id_fabricante = (
    SELECT id
    FROM fabricante 
    WHERE nombre = 'Lenovo'
);

-- 2 Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT *
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE id_fabricante = (
        SELECT id
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);

-- 3.Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * 
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE id_fabricante = (
        SELECT id
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);

-- 4.Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT nombre
FROM producto
WHERE precio = (
    SELECT MIN(precio)
    FROM producto
    WHERE id_fabricante = (
        SELECT id
        FROM fabricante
        WHERE nombre = 'Hewlett-Packard'
    )
);

-- 5.Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto
WHERE precio >= (
    SELECT MAX(precio) FROM producto
    WHERE id_fabricante = (
        SELECT id FROM fabricante
        WHERE nombre = 'Lenovo')
    );

-- 6.Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM producto
WHERE id_fabricante = (
    SELECT id FROM fabricante
    WHERE nombre = 'Asus')
AND precio > (
    SELECT AVG(precio) FROM producto
    WHERE id_fabricante = (
        SELECT id FROM fabricante
    WHERE nombre = 'Asus'));

-- 7.Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM producto
WHERE precio >= ALL (
    SELECT precio FROM producto);

-- 8.Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT * FROM producto
WHERE precio <= ALL (
    SELECT precio FROM producto
);

-- 9.Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre 
FROM fabricante 
WHERE id = ANY (
    SELECT id_fabricante 
    FROM producto
);

-- 10.Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre
FROM fabricante
WHERE id != ALL (
    SELECT id_fabricante
    FROM producto
);


-- 11.Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre
FROM fabricante
WHERE id IN (
    SELECT id_fabricante
    FROM producto
);


-- 12.Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT nombre
FROM fabricante
WHERE id NOT IN (
    SELECT id_fabricante
    FROM producto
);


-- 13.Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT f.nombre
FROM fabricante AS f
WHERE EXISTS (
    SELECT 1
    FROM producto AS p
    WHERE p-.id_fabricante = f.id
);

-- 14.Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT f.nombre
FROM fabricante AS f
WHERE NOT EXISTS (
    SELECT 1
    FROM producto AS p
    WHERE p.id_fabricante = f.id
);

-- 15. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT p.nombre, p.precio, f.nombre
FROM fabricante AS f
JOIN producto AS p ON f.id = p.id_fabricante
WHERE p.precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE id_fabricante = f.id
);


-- 16. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT p.*
FROM producto AS p
WHERE p.precio >= (
    SELECT AVG(precio)
    FROM producto
    WHERE id_fabricante = p.id_fabricante
);
SELECT p.*
FROM producto AS p
JOIN fabricante AS f on p.id_fabricante = f.id
WHERE precio >= (
    SELECT AVG(precio)
    FROM producto
    WHERE id_fabricante =f.id
);

-- 17.Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE id_fabricante = (
        SELECT id 
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);


-- 18.Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT f.nombre, COUNT(p.id)
FROM fabricante AS f
JOIN producto AS p ON f.id = p.id_fabricante
GROUP BY f.nombre
HAVING COUNT(p.id) = (
    SELECT COUNT(p.id)
    FROM producto AS p
    JOIN fabricante AS f ON p.id_fabricante = f.id
    WHERE f.nombre = 'Lenovo'
)

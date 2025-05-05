-- CONSULTAS SENCILLAS
-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT * FROM pedido ORDER BY fecha DESC;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT * FROM pedido ORDER BY total DESC LIMIT 2;

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT id_cliente FROM pedido;

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
SELECT * FROM pedido WHERE YEAR(fecha) = 2017 AND total > 500;

-- 5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
SELECT id, nombre, apellido1, apellido2, comision FROM comercial WHERE comision > 0.05 and comision < 0.11;

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
SELECT MAX(TRUNCATE(comision, 2)) FROM comercial;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
SELECT id, nombre, apellido1 FROM cliente WHERE apellido2 IS NOT NULL ORDER BY apellido1, nombre;

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM cliente WHERE (nombre LIKE 'A%' AND nombre LIKE '%n') OR nombre LIKE 'P%';
 
-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM cliente WHERE nombre NOT LIKE 'A%' ORDER BY nombre;

-- 10. Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT nombre FROM comercial WHERE nombre LIKE '%el' OR nombre LIKE '%o';

-- COMPOSICIÓN INTERNA
-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT DISTINCT c.id, c.apellido1, c.apellido2, c.nombre
FROM cliente as c
JOIN pedido as p on c.id = p.id_cliente
ORDER BY c.apellido1;

-- 2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT c.*, p.*
FROM cliente as c
JOIN pedido as p ON c.id = p.id_cliente
ORDER BY c.apellido1;

-- 3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
SELECT c.*, p.*
FROM comercial AS c
JOIN pedido AS p ON c.id = p.id_comercial
ORDER BY c.apellido1;

-- 4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
SELECT c.*, p.*, co.*
FROM cliente as c
JOIN pedido AS p ON c.id = p.id_cliente
JOIN comercial as co on co.id = p.id_comercial;

-- 5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
SELECT c.*, p.*
FROM cliente as c
JOIN pedido as p ON c.id = p.id_cliente
WHERE YEAR(fecha) = 2017 
AND total BETWEEN 300 AND 1000;

-- 6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
SELECT distinct co.apellido1, co.apellido2, co.nombre
FROM comercial as co
JOIN pedido as p on co.id = p.id_comercial
JOIN cliente as c on c.id = p.id_cliente
WHERE p.id_cliente = (
    SELECT id
    FROM cliente AS c
    WHERE c.nombre = 'María' and c.apellido1 = 'Santana' and c.apellido2 = 'Moreno'
);

-- 7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
SELECT distinct c.apellido1, c.apellido2, c.nombre
FROM cliente as c
JOIN pedido as p on c.id = p.id_cliente
JOIN comercial as co on p.id_comercial = co.id
WHERE co.nombre = 'Daniel' AND co.apellido1 = 'Sáez' AND co.apellido2 = 'Vega';

-- COMPOSICIÓN EXTERNA
-- 1. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
SELECT c.apellido1, c.apellido2, c.nombre, p.*
FROM cliente as c
LEFT JOIN pedido as p on c.id = p.id_cliente
ORDER BY c.apellido1, nombre;

-- 2. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
SELECT co.*, p.*
FROM comercial as co
LEFT JOIN pedido as p on p.id_comercial = co.id
ORDER BY co.apellido1, co.nombre;

-- 3. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido. 
SELECT c.*, p.*
FROM cliente as c
LEFT JOIN pedido as p on c.id = p.id_cliente
WHERE p.id_cliente IS NULL;

-- 4. Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
SELECT co.*, p.*
FROM comercial as co
LEFT JOIN pedido as p on co.id = p.id_comercial
WHERE p.id_comercial IS NULL;

-- 5. Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes y los comerciales.
SELECT c.apellido1, c.apellido2, c.nombre, 'Cliente' AS tipo
FROM cliente as c
LEFT JOIN pedido as p on c.id = p.id_cliente
WHERE p.id_cliente IS NULL

UNION

SELECT co.apellido1, co.apellido2, co.nombre, 'Comercial' AS tipo
FROM comercial AS co
LEFT JOIN pedido as p on p.id_comercial = co.id
WHERE p.id_comercial IS NULL
ORDER BY apellido1, apellido2, nombre;

-- CONSULTAS RESUMEN
-- 1. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT SUM(total) FROM pedido;

-- 2. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(total) FROM pedido;

-- 3. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT COUNT(distinct(id_comercial)) FROM pedido;

-- 4. Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT COUNT(*) FROM cliente;

-- 5. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(total) FROM pedido;

-- 6. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT MIN(total) FROM pedido;

-- 7. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT ciudad, MAX(categoria) FROM cliente GROUP BY ciudad;

-- 8. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
SELECT 
    c.id AS id_cliente,
    c.nombre AS nombre,
    c.apellido1,
    c.apellido2,
    p.fecha,
    MAX(p.total) AS max_pedido
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
GROUP BY c.id, p.fecha
ORDER BY c.id, p.fecha;

-- 9. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
SELECT c.id, c.nombre, c.apellido1, c.apellido2, p.fecha, MAX(p.total)
FROM cliente as c
JOIN pedido as p on c.id = p.id_cliente
GROUP BY c.id, c.nombre, c.apellido1, c.apellido2, p.fecha
HAVING MAX(p.total) > 2000

-- 10. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
SELECT co.id, co.nombre, co.apellido1, MAX(p.total)
FROM comercial as co
JOIN pedido as p on co.id = p.id_comercial
WHERE p.fecha = '2016-08-17'
GROUP BY co.id;

-- 11. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
SELECT c.id, c.nombre, c.apellido1, c.apellido2, COUNT(p.id)
FROM cliente as c
LEFT JOIN pedido as p on c.id = p.id_cliente
GROUP BY c.id;

-- 12. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
SELECT c.id, c.nombre, c.apellido1, c.apellido2, COUNT(p.id)
FROM cliente as c
JOIN pedido as p on c.id = p.id_cliente
WHERE YEAR(fecha) = 2017
GROUP BY c.id;

-- 13. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.
SELECT c.id, c.nombre, c.apellido1, c.apellido2, IFNULL(MAX(p.total), 0)
FROM cliente as c
LEFT JOIN pedido as p on c.id = p.id_cliente
GROUP BY c.id;

-- 14. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT YEAR(fecha), MAX(total)
FROM pedido
GROUP BY YEAR(fecha);

-- 15. Devuelve el número total de pedidos que se han realizado cada año.
SELECT YEAR(fecha), COUNT(id)
FROM pedido
GROUP BY YEAR(fecha);

-- SUBCONSULTAS
-- 1. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
SELECT *
FROM pedido
WHERE id_cliente = (
SELECT id
FROM cliente
WHERE nombre = 'Adela' AND apellido1 = 'Salas' AND apellido2 = 'Díaz');

-- 2. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
SELECT COUNT(*)
FROM pedido
WHERE id_comercial = (
SELECT id
FROM comercial
WHERE nombre = 'Daniel' AND apellido1 = 'Sáez' AND apellido2 = 'Vega');

-- 3. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
SELECT *
FROM cliente
WHERE id = (
    SELECT id_cliente
    FROM pedido
    WHERE total = (
        SELECT MAX(total)
        FROM pedido
        WHERE YEAR(fecha) = 2019
    )
);

-- 4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
SELECT fecha, total
FROM pedido
WHERE id_cliente = (
    SELECT id
    FROM cliente
    WHERE nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana')
AND total = (
    SELECT MIN(total)
    FROM pedido
    WHERE id_cliente = (
        SELECT id
        FROM cliente
        WHERE nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana'
    )
);

-- 5. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
SELECT c.*, p.*
FROM cliente AS c 
JOIN pedido as p ON p.id_cliente = c.id
WHERE YEAR(p.fecha) = 2017
AND p.total >= (
    SELECT AVG(total)
    FROM pedido
    WHERE YEAR(fecha) = 2017
);

-- 6. Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, ORDER BY ni LIMIT.
SELECT *
FROM pedido
WHERE total >= ALL(
    SELECT total
    FROM pedido
);

-- 7. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT *
FROM cliente
WHERE id != ALL(
    SELECT id_cliente
    FROM pedido
);

-- 8. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando ANY o ALL).
SELECT *
FROM comercial
WHERE id != ALL(
    SELECT id_comercial
    FROM pedido
);

-- 9. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT *
FROM cliente
WHERE id NOT IN(
    SELECT id_cliente
    FROM pedido
);

-- 10. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
SELECT *
FROM comercial
WHERE id NOT IN(
    SELECT id_comercial
    FROM pedido
);

-- 11. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT *
FROM cliente as c
WHERE NOT EXISTS(
    SELECT 1
    FROM pedido
    WHERE id_cliente = c.id
);

-- 12. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
SELECT *
FROM comercial as co
WHERE NOT EXISTS(
    SELECT 1
    FROM pedido
    WHERE id_comercial= co.id
);
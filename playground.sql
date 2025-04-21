-- 11
SELECT f.nombre
FROM fabricante AS f
WHERE f.id IN (
SELECT id_fabricante
FROM producto);

-- 12
SELECT f.nombre
FROM fabricante AS f
WHERE NOT f.id IN(
SELECT id_fabricante
FROM producto);

-- 16 
SELECT p.id, p.nombre, p.precio, p.id_fabricante
FROM producto AS p
JOIN fabricante AS f
ON p.id_fabricante = f.id
WHERE p.precio >= (
SELECT AVG(precio)
FROM producto
WHERE id_fabricante = f.id);

-- 17
SELECT p.nombre
FROM producto AS p
JOIN fabricante AS f
ON p.id_fabricante = f.id
WHERE p.precio =(
    SELECT MAX(precio)
    FROM producto AS p
    JOIN fabricante as f
    ON p.id_fabricante = f.id
    WHERE f.nombre = 'Lenovo');

-- 18 Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
SELECT f.nombre, COUNT(p.id) AS total_producto
FROM fabricante AS f
JOIN producto AS p ON p.id_fabricante = f.id
GROUP BY f.id, f.nombre
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM producto AS p
    JOIN fabricante AS f2 ON p.id_fabricante = f2.id
    WHERE f2.nombre = 'Lenovo'
);

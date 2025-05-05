DECLARE nombre_variable tipo_dato [DEFAULT valor_inicial];

DECLARE edad_cliente INT DEFAULT 0;
DECLARE nombre_cliente VARCHAR(100);

DELIMITER $$

CREATE PROCEDURE ejemplo_declaracion()
BEGIN
    -- Todas las declaraciones van primero
    DECLARE contador INT DEFAULT 0;
    DECLARE mensaje VARCHAR(100);
    DECLARE total_registros INT;

    -- Después se pueden usar SET, SELECT, IF, etc.
    SET contador = 5;

    SELECT COUNT(*) INTO total_registros
    FROM usuarios;

    IF total_registros > 0 THEN
        SET mensaje = 'Hay registros en la tabla usuarios.';
    ELSE
        SET mensaje = 'La tabla usuarios está vacía.';
    END IF;

    SELECT mensaje;
END $$

DELIMITER ;
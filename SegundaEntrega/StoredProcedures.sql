USE ch_pf_vilchez;
-- ---- ENTREGA DE STORED PROCEDURES -----
-- <<<<Primera Stored Procedure: ORDER BY con dos o mas variables>>>>
DROP PROCEDURE IF EXISTS SP_orderBy;
-- indicar delimitador a utilizar
DELIMITER //
-- Se crea SP con los parametros a utilizar y tipo de parametros que acepta:
CREATE PROCEDURE SP_orderBy (in tableToUse varchar (30),
							 in tableField varchar (25),
							 in direction varchar (4),
							 OUT p_final varchar (100)
)
BEGIN
-- Junta los strings fijos con los parámetros de entrada al utilizar el concat
SET @p_final = CONCAT('SELECT * FROM ', tableToUse, ' ORDER BY ', tableField, ' ', direction);
-- Prepara el string + query 
PREPARE param_stmt from @p_final  ;
-- Ejecuta query
EXECUTE param_stmt;
-- Suelta la declaracion compilada/preparada
DEALLOCATE PREPARE param_stmt;
END //
DELIMITER ;

-- Dar informacion especifica a los parámetros IN del SP.
SET @tableToUse = 'artist'; -- tabla a utilizar
SET @tableField = 'artistic_name'; -- campo de tabla a utilizar
SET @direction = 'desc'; -- aca puede ser ASC o DESC
-- Llamar SP
CALL SP_orderBy (@tableToUse , @tableField , @direction,  @p_final);

-- <<<<Segunda Stored Procedure: Insertar y Eliminar Datos de una tabla>>>>
DROP PROCEDURE IF EXISTS SP_ManageArtist;
DELIMITER //
CREATE PROCEDURE SP_ManageArtist(
    IN p_operation VARCHAR(10), -- Parametro IN que le indica al If/Else que condicion va a realizar.
    INOUT p_artist_id INT,      -- Parametro INOUT para el ID de artista.
    IN p_artistic_name VARCHAR(25),
    IN p_first_name VARCHAR(30),
    IN p_last_name VARCHAR(30),
    IN p_phone VARCHAR(15)
)
BEGIN
    IF p_operation = 'INSERT' THEN
        -- Insertar un nuevo artista a la tabla artist
        INSERT INTO artist (artistic_name, first_name, last_name, phone) 
        VALUES (p_artistic_name, p_first_name, p_last_name, p_phone);
        -- Obtener el ID del ultimo artista insertado para poderlo utilizar al hacer el SELECT
        SET p_artist_id = LAST_INSERT_ID();
    ELSEIF p_operation = 'DELETE' THEN
        -- Almacenar el ID del artista antes de eliminarlo
        SET @deleted_artist_id := p_artist_id;
        -- Eliminar un registro de artista por su ID
        DELETE FROM artist WHERE artist_id = @deleted_artist_id LIMIT 1;
        -- Restablecer el ID del artista despues de eliminar un registro de la tabla 
        SET p_artist_id = NULL;
    END IF;
END //
DELIMITER ;

-- --------- PARTE 1 DE LA SEGUNDA STORED PROCEDURE ------ INSERTAR DATOS 
-- Ejecutar el SP para insertar un nuevo registro 
-- CALL SP_ManageArtist('INSERT', @new_artist_id, 'artistic_name', 'first_name', 'last_name', 'phone');
CALL SP_ManageArtist('INSERT', @new_artist_id, 'Ed Sheeran', 'Edward', 'Sheeran', '123456789');

-- Aca verificamos que si se haya incluido un nuevo registro exitosamente utilizando tanto el parametro de salida como el select * from habitual de una tabla.
SELECT @new_artist_id;
SELECT * FROM artist;

-- --------- PARTE 2 DE LA SEGUNDA STORED PROCEDURE ------ ELIMINAR DATOS 
-- Darle un valor a la variable para luego utilizarla en el SP.
SET @artist_id_to_delete = 30; -- Reemplazar el 30 por el numero del artist id a eliminar, en este caso coloque el id 30 ya que fue el ultimo registro agregado.
-- Ejecutar/llamar al SP para la condicion de Delete.
CALL SP_ManageArtist('DELETE', @artist_id_to_delete, '', '', '', '');

-- Verificar nuevamente que solo queden 29 artist ids en la tabla.
SELECT * FROM artist;
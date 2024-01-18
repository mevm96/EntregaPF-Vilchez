USE ch_pf_vilchez;
-- /// ENTREGA TRIGGERS, PRIMER TRIGGER con AFTER ///

DROP TABLE IF EXISTS artists_audit_log;
CREATE TABLE IF NOT EXISTS artists_audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    table_nombre VARCHAR(50),
    action_type VARCHAR(10),
    usuario VARCHAR(100),
    record_id INT,
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- After Insert Trigger: con este trigger se almacenara la informacion en la tabla "artists_audit_log" luego de cada insercion de datos de un nuevo artista a la tabla de "artist" 
DROP TRIGGER IF EXISTS after_insert_artist;
DELIMITER //
CREATE TRIGGER after_insert_artist
AFTER INSERT ON artist
FOR EACH ROW
BEGIN
    INSERT INTO artists_audit_log (table_nombre, action_type, usuario, record_id, action_timestamp) 
    VALUES ('artist', 'INSERT', CURRENT_USER(), NEW.artist_id, NOW());
END;
//
DELIMITER ;

-- After Update Trigger: con este trigger se almacenara la informacion en la tabla "artists_audit_log" luego de cada actualizacion de datos de un artistas existentes presentes en la tabla de "artist".
DROP TRIGGER IF EXISTS after_update_artist;
DELIMITER //
CREATE TRIGGER after_update_artist
AFTER UPDATE ON artist
FOR EACH ROW
BEGIN
    INSERT INTO artists_audit_log (table_nombre, action_type, usuario, record_id, action_timestamp) 
    VALUES ('artist', 'UPDATE', CURRENT_USER(), NEW.artist_id, NOW());
END;
//
DELIMITER ;

-- After Delete Trigger: con este trigger se almacenara la informacion en la tabla "artists_audit_log" luego de cada eliminacion de datos de un artistas existentes presentes en la tabla de "artist".
DROP TRIGGER IF EXISTS after_delete_artist;
DELIMITER //
CREATE TRIGGER after_delete_artist
AFTER DELETE ON artist
FOR EACH ROW
BEGIN
    INSERT INTO artists_audit_log (table_nombre, action_type, usuario, record_id, action_timestamp) 
    VALUES ('artist', 'DELETE', CURRENT_USER(), OLD.artist_id, NOW());
END;
//
DELIMITER ;

INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (31,'Lucy Dacus','Lucy','Dacus','+17343498018');

DELETE FROM artist WHERE artist_id = 30 LIMIT 1;

UPDATE artist
SET artist_id = 30, phone = '+1234567890'
WHERE artist_id = 31;

SELECT * FROM artists_audit_log;
SELECT * FROM artist;

-- /// ENTREGA TRIGGERS, SEGUNDO TRIGGER con BEFORE ///
DROP TRIGGER IF EXISTS album_audit_log;
CREATE TABLE IF NOT EXISTS album_audit_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    table_nombre VARCHAR(50),
    action_type VARCHAR(10),
    usuario VARCHAR(100),
    record_id INT,
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- El proposito de este Trigger es asegurar que el año de lanzamiento de un album este dentro de un rango en especifico y adicionalmente, dar un valor default de duracion a un album si no lo tiene
-- y por ultimo, la creacion del registro del entry o record en la tabla de auditoria especifica para modificaciones en la tabla album.

DROP TRIGGER IF EXISTS before_insert_album;
DELIMITER //
CREATE TRIGGER before_insert_album
BEFORE INSERT ON album
FOR EACH ROW
BEGIN
    -- Verificar y adjustar la fecha de lanzamiento del album a que este entre 1900 y el actual.
    IF NEW.release_year < 1900 OR NEW.release_year > YEAR(CURDATE()) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Release year must be between 1900 and the current year.';
    END IF;

    -- Dar un valor por default si el album no tiene duracion.
    IF NEW.album_length IS NULL THEN
        SET NEW.album_length = '00:00:00';
    END IF;

    -- Aca se crea el record o la entry a la tabla de auditoria.
    INSERT INTO album_audit_log (table_nombre, action_type, usuario, record_id, action_timestamp) 
    VALUES ('album', 'INSERT', CURRENT_USER(), NEW.album_id, NOW());
END;
//
DELIMITER ;

-- Ejemplo de fecha invalida
INSERT INTO album (title, sales, release_year) VALUES ('Historian', 501000, 1899);

-- Ejemplo de fecha valida pero sin especificar la duracion del album:
INSERT INTO album (title, sales, release_year) VALUES ('Historian', 501000, 2018);

SELECT * FROM album_audit_log;
SELECT * FROM album;
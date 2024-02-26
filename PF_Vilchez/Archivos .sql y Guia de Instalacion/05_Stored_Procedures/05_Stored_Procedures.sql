-- DROP SCHEMA IF EXISTS pf_vilchez;
CREATE SCHEMA IF NOT EXISTS pf_vilchez;
USE pf_vilchez;

DROP PROCEDURE IF EXISTS SP_orderBy;
DELIMITER //
CREATE PROCEDURE SP_orderBy (in tableToUse varchar (30),
							 in tableField varchar (25),
							 in direction varchar (4),
							 OUT p_final varchar (100)
)
BEGIN
SET @p_final = CONCAT('SELECT * FROM ', tableToUse, ' ORDER BY ', tableField, ' ', direction);
PREPARE param_stmt from @p_final  ;
EXECUTE param_stmt;
DEALLOCATE PREPARE param_stmt;
END //
DELIMITER ;

SET @tableToUse = 'artist';
SET @tableField = 'artistic_name';
SET @direction = 'desc';

CALL SP_orderBy (@tableToUse , @tableField , @direction,  @p_final);

DROP PROCEDURE IF EXISTS SP_ManageArtist;
DELIMITER //
CREATE PROCEDURE SP_ManageArtist(
    IN p_operation VARCHAR(10),
    INOUT p_artist_id INT,
    IN p_artistic_name VARCHAR(25),
    IN p_first_name VARCHAR(30),
    IN p_last_name VARCHAR(30),
    IN p_phone VARCHAR(15)
)
BEGIN
    IF p_operation = 'INSERT' THEN
        INSERT INTO artist (artistic_name, first_name, last_name, phone) 
        VALUES (p_artistic_name, p_first_name, p_last_name, p_phone);
        SET p_artist_id = LAST_INSERT_ID();
    ELSEIF p_operation = 'DELETE' THEN
        SET @deleted_artist_id := p_artist_id;
        DELETE FROM artist WHERE artist_id = @deleted_artist_id LIMIT 1;
        SET p_artist_id = NULL;
    END IF;
END //
DELIMITER ;

CALL SP_ManageArtist('INSERT', @new_artist_id, 'Ed Sheeran', 'Edward', 'Sheeran', '123456789');

SELECT @new_artist_id;
SELECT * FROM artist;

SET @artist_id_to_delete = 30;
CALL SP_ManageArtist('DELETE', @artist_id_to_delete, '', '', '', '');

SELECT * FROM artist;
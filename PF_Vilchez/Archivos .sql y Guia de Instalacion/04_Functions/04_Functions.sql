-- DROP SCHEMA IF EXISTS pf_vilchez;
CREATE SCHEMA IF NOT EXISTS pf_vilchez;
USE pf_vilchez;

DROP FUNCTION IF EXISTS FN_song_count;
DELIMITER $$
CREATE FUNCTION FN_song_count(P_album_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE song_count INT;
    SELECT COUNT(*) INTO song_count
    FROM album_song
    WHERE album_song.album_id = P_album_id;
    RETURN song_count;
END$$
DELIMITER ;

SELECT FN_song_count(6) AS songs_by_album;
SELECT FN_song_count(3) AS songs_by_album;

DROP FUNCTION IF EXISTS FN_pd_count_by_nationality;
DELIMITER $$
CREATE FUNCTION FN_pd_count_by_nationality(P_nationality VARCHAR(10))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE producer_count INT;
    SELECT COUNT(DISTINCT producer.pd_id) INTO producer_count
    FROM producer
    JOIN song_producer ON producer.pd_id = song_producer.pd_id
    WHERE producer.nationality = P_nationality;
    RETURN producer_count;
END$$
DELIMITER ;

SELECT FN_pd_count_by_nationality('venezuelan') AS PDs_by_nationality;
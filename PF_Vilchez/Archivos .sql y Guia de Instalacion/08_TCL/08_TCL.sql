USE pf_vilchez;

-- SELECT @@autocommit;
-- SELECT @@sql_safe_updates;
-- SET @@autocommit = 0;
-- SET @@sql_safe_updates = 0;

-- SELECT * FROM artist;
-- SELECT * FROM song;

INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (32,'Luna Harmony', 'Seraphina', 'Everglow', '+5557891234');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (33,'Nebula Dreamer', 'Orion', 'Starlight', '+5554567890');
-- inserte datos adicionales para borrar los ultimos dos registros en la tabla> artist_id 32 & 33.

START TRANSACTION;

DELETE FROM artist WHERE artist_id = 32;
DELETE FROM artist WHERE artist_id = 33;
SELECT * FROM artist;

-- ROLLBACK;
-- COMMIT;

-- SELECT * FROM ARTIST;
-- SELECT * FROM artists_audit_log;

START TRANSACTION;

INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (42,'Femininomenon','00:03:39');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (43,'Red Wine Supernova','00:03:12');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (44,'HOT TO GO!','00:03:04');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (45,'Pink Pony Club','00:04:18');
SAVEPOINT sp_4;
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (46,'Black Hole','00:02:21');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (47,'Afraid of Heights','00:02:41');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (48,'Voyager','00:02:48');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (49,'Powers','00:04:14');
SAVEPOINT sp_8;

-- ROLLBACK;
-- COMMIT;
-- RELEASE SAVEPOINT sp_4;

SELECT * FROM song;
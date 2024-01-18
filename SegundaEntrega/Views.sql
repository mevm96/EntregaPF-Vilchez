USE ch_pf_vilchez;

-- /// Esta vista contiene todos los datos de los artistas, su objetivo es propocionar la informacion de los artistas de una manera mas directa al usuario que lo solicite, 
-- sin el artist_id que los identifica dentro de la BBD y esta compuesta por la tabla de Artistas.
DROP VIEW IF EXISTS artist_details;
CREATE VIEW artist_details AS
(
SELECT artistic_name, first_name, last_name, phone
FROM artist
);

SELECT * FROM artist_details;

-- /// Esta vista organiza y agrupo a los Artistas por Productora Musical, para facilitar la visualizacion de los datos, esta compuesta por las tablas: record_label, record_label_artist y artist.
-- DROP VIEW IF EXISTS Record_Label_Artist_Details;
CREATE VIEW Record_Label_Artist_Details AS
(
SELECT a.artistic_name,rl.rl_name AS "Music Label" FROM artist a
LEFT JOIN record_label_artist rla ON a.artist_id = rla.artist_id
LEFT JOIN record_label rl ON rla.rl_id = rl.rl_id 
ORDER BY rl.rl_name
);

SELECT * FROM Record_Label_Artist_Details;

-- /// Esta vista permite obtener de manera sencilla a los generos musicales presentes en cada album, para facilitar la visualizacion de los datos y esta compuesta por las tablas: album, album_genre y genre.
-- DROP VIEW IF EXISTS album_genre_association;
CREATE VIEW album_genre_association AS
(
SELECT a.album_id, MAX(a.title) AS title, GROUP_CONCAT(ag.genre_id) AS genre_ids, GROUP_CONCAT(g.music_genre) AS music_genres
FROM album_genre ag
JOIN album a ON ag.album_id = a.album_id
JOIN genre g ON ag.genre_id = g.genre_id
GROUP BY a.album_id
);
SELECT * FROM album_genre_association;

-- /// Esta vista permite obtener los productores musicales con mayor cantidad de canciones producidas registradas dentro de la BBDD para facilitar la busqueda de los mismos y esta compuesta por las tablas: producer y song_producer.
-- DROP VIEW IF EXISTS top_producers;
CREATE VIEW top_producers AS 
(
SELECT p.producer_name, COUNT(sp.song_id) AS total_songs_produced
FROM producer p
LEFT JOIN song_producer sp ON p.pd_id = sp.pd_id
GROUP BY p.producer_name
); 
SELECT * FROM top_producers;

-- /// Esta vista permite filtrar las canciones de colaboraciones donde esten presentes Charli XCX y Caroline Polachek ya que son las artistas con mayor cantidad de colaboraciones y facilita la busqueda
-- de dichas colaboraciones y esta compuesta por las tablas: artist, song y featuring.
-- DROP VIEW IF EXISTS CharliXCX_CarolinePolachek_Collabs;
CREATE VIEW CharliXCX_CarolinePolachek_Collabs AS 
(
SELECT a.artist_id,a.artistic_name,
GROUP_CONCAT(s.title) AS song_titles,
COUNT(f.song_id) AS collaboration_count
FROM artist a
JOIN featuring f ON a.artist_id = f.artist_id
JOIN song s ON f.song_id = s.song_id
WHERE f.release_date IS NOT NULL
AND a.artist_id IN (12, 15, 16, 26, 27, 28, 29)
GROUP BY a.artist_id
); 

SELECT * FROM CharliXCX_CarolinePolachek_Collabs;
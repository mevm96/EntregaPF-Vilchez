-- DROP SCHEMA IF EXISTS ch_pf_vilchez;
CREATE SCHEMA IF NOT EXISTS ch_pf_vilchez;
USE ch_pf_vilchez;

CREATE TABLE IF NOT EXISTS artist 
(
	artist_id INT AUTO_INCREMENT NOT NULL,
    artistic_name VARCHAR(25),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    phone VARCHAR(15) NOT NULL,
    PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS record_label
(
	rl_id INT AUTO_INCREMENT NOT NULL,
    rl_name VARCHAR(35) UNIQUE,
    PRIMARY KEY (rl_id)
);

-- Artist-Record Label: N:M relationship between artists and labels.
CREATE TABLE IF NOT EXISTS record_label_artist
(
	artist_id INT NOT NULL,
    rl_id INT NOT NULL,
    PRIMARY KEY(artist_id,rl_id),
    CONSTRAINT fk_rla_artist FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
    CONSTRAINT fk_rla_rl FOREIGN KEY (rl_id) REFERENCES record_label(rl_id)
);

CREATE TABLE IF NOT EXISTS branch
(
	branch_id INT AUTO_INCREMENT NOT NULL,
    branch_name VARCHAR(30) UNIQUE,
    location VARCHAR(20),
    rl_id INT NOT NULL,
    PRIMARY KEY (branch_id),
    KEY rl_id(rl_id),
    CONSTRAINT fk_rl FOREIGN KEY(rl_id) REFERENCES record_label(rl_id)
);

CREATE TABLE IF NOT EXISTS producer
(
	pd_id INT AUTO_INCREMENT NOT NULL,
    producer_name VARCHAR(25),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    phone VARCHAR(15) NOT NULL,
    gender ENUM('F','M'),
    DOB DATE, -- Date of Birth
    nationality VARCHAR(10),
    PRIMARY KEY (pd_id)
);

CREATE TABLE IF NOT EXISTS album
(
	album_id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(40),
    sales INT,
    release_year YEAR,
    album_length TIME,
    PRIMARY KEY (album_id)
);

CREATE TABLE IF NOT EXISTS song
(
	song_id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(30),
    duration TIME,
    PRIMARY KEY (song_id)
);

-- Song-Producer: N:M relationship between songs and producers.
CREATE TABLE IF NOT EXISTS song_producer
(
	song_id INT NOT NULL,
    pd_id INT NOT NULL,
    PRIMARY KEY(song_id,pd_id),
    CONSTRAINT fk_sp_song FOREIGN KEY (song_id) REFERENCES song(song_id),
    CONSTRAINT fk_sp_pd FOREIGN KEY (pd_id) REFERENCES producer(pd_id)
);

-- Featuring: Collaborations between artists on specific songs.
CREATE TABLE IF NOT EXISTS featuring
(
	artist_id INT NOT NULL,
    song_id INT NOT NULL,
    release_date YEAR,
    PRIMARY KEY (artist_id,song_id),
    CONSTRAINT fk_ft_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
	CONSTRAINT fk_ft_song FOREIGN KEY(song_id) REFERENCES song(song_id)
);

-- Album-Song: N:M relationship between albums and songs.
CREATE TABLE IF NOT EXISTS album_song
(
	album_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY(album_id,song_id),
    CONSTRAINT fk_as_album FOREIGN KEY (album_id) REFERENCES album(album_id),
    CONSTRAINT fk_as_song FOREIGN KEY (song_id) REFERENCES song(song_id)
);

-- Album-Producer: N:M relationship between albums and producers.
CREATE TABLE IF NOT EXISTS album_producer
(
	album_id INT NOT NULL,
    pd_id INT NOT NULL,
    PRIMARY KEY(album_id,pd_id),
    CONSTRAINT fk_ap_album FOREIGN KEY (album_id) REFERENCES album(album_id),
    CONSTRAINT fk_ap_pd FOREIGN KEY (pd_id) REFERENCES producer(pd_id)
);

-- Album-Artist: N:M relationship between albums and artists.
CREATE TABLE IF NOT EXISTS album_artist
(
	album_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY(album_id,artist_id),
    CONSTRAINT fk_aa_album FOREIGN KEY (album_id) REFERENCES album(album_id),
    CONSTRAINT fk_aa_artist FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);

CREATE TABLE IF NOT EXISTS distribuitor
(
	dist_id INT AUTO_INCREMENT NOT NULL,
    dist_name VARCHAR(25) UNIQUE,
    country VARCHAR(15),
	album_id INT NOT NULL,
    PRIMARY KEY (dist_id),
    KEY album_id(album_id),
    CONSTRAINT fk_dist_album FOREIGN KEY (album_id) REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS genre
(
	genre_id INT AUTO_INCREMENT NOT NULL,
	music_genre VARCHAR(15),
    PRIMARY KEY (genre_id)
);

-- Album-Genre Association: N:M relationship between albums and genres.
CREATE TABLE IF NOT EXISTS album_genre
(
	album_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY(album_id,genre_id),
    CONSTRAINT fk_ag_album FOREIGN KEY (album_id) REFERENCES album(album_id),
    CONSTRAINT fk_ag_genre FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

-- Song-Genre Association: N:M relationship between songs and genres.
CREATE TABLE IF NOT EXISTS song_genre
(
	song_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY(song_id,genre_id),
    CONSTRAINT fk_sg_song FOREIGN KEY (song_id) REFERENCES song(song_id),
    CONSTRAINT fk_sg_genre FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE IF NOT EXISTS song_artist
(
	song_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY(song_id,artist_id),
    CONSTRAINT fk_sa_song FOREIGN KEY (song_id) REFERENCES song(song_id),
    CONSTRAINT fk_sa_artist FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);
-- INSERT Date: 2023-12-25 22:49
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (1,'C Hundreds','Craig','Hendrix','+14109559707','M','1980-12-12','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (2,'Hector Castillo','Hector','Castillo','+6117723478','M','1976-04-17','Venezuelan');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (3,'DPR REM','Scott','Kim','+6879112199','M','1992-02-21','Korean');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (4,'Catherine Marks','Catherine','Marks','+7891020045','F','1989-12-01','Australian');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (5,'Jay Som','Melina','Duterte','+14105467891','F','1994-03-25','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (6,'Tudz','Sarah','Tudzin','+5551234567','F','1997-04-13','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (7,'Wild Nothing','Jack','Tatum','+5559876543','M','1988-10-06','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (8,'Patrick Hyland','Patrick','Hyland','+5555555555','M','1990-12-23','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (9,'Aaron Dessner','Aaron','Dessner','+9113458901','M','1976-04-23','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (10,'Blake Slatkin','Blake','Slatkin','+4961312460','M','1997-06-10','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (11,'Magnus Skylstad','Magnus Aserud','Skylstad','+1236549870','M','1983-06-17','Norwegian');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (12,'BloodPop','Michael','Tucker','+1012343456','M','1990-08-15','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (13,'Cardopusher','Luis','Valdeon','+12021235432','M','1981-02-27','Venezuelan');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (14,'Rudy Pagliuca','Rodolfo','Pagliuca','+4143678861','M','1971-09-10','Venezuelan');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (15,'Max Martin','Karl','Martin','+3678861414','M','1971-02-26','Swedish');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (16,'Danny L Harle','Daniel','Eisner','+9001236745','M','1990-11-21','British');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (17,'Nova Blue','Manon','Van Dijk','+8013426785','F','2002-12-22','Dutch');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (18,'Pink Slip','Kyle','Buckley','+9019989796','M','2001-04-08','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (19,'George Daniel','George','Daniel','+32482886728','M','1990-03-23','Belgian');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (20,'Digital Farm Animals','Nick','Gale','+441824392053','M','1989-07-02','British');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (21,'Jeff Bhasker','Jeff','Bhasker','12818816777','M','1974-04-03','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (23,'Jack Antonoff','Jack','Antonoff','+14488466661','M','1984-03-31','American');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (24,'Cityfall','Laurie','Blundell','+448439327853','F','1996-10-25','British');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (25,'E Tribe','Youngdeuk','Kim','+825313581805','M','1985-05-30','Korean');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (26,'Christine and the Queens','Heloise','Letissier','+33937934358','M','1988-01-05','French');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (27,'A G Cook','Alexander','Cook','+445669406905','M','1990-08-23','British');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (28,'Tiesto','Tijs','Verwest','+31387230884','M','1969-01-17','Dutch');
INSERT INTO `producer` (`pd_id`,`producer_name`,`first_name`,`last_name`,`phone`,`gender`,`DOB`,`nationality`) VALUES (29,'Jax Jones','Timucin','Lam','+445600201689','M','1987-07-25','British');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (1,'Americania','Italo','Pizzolante','+584143678861');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (2,'DPR IAN','Christian','Yu','+442019234567');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (3,'boygenius','Lucy','Dacus','+19012610018');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (4,'Japanese Breakfast','Michelle','Zauner','+442903198908');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (5,'Mistki','Mitski','Miyawaki','+14327557123');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (6,'Taylor Swift','Taylor','Swift','+18006982536');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (7,'Gracie Abrams','Gracie','Abrams','+18006982536');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (8,'La Vida Boheme','Rafael','Perez','+19108765436');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (9,'LOONA','Wong','Kahei','+19108701436');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (10,'Aurora','Aurora','Aksnes','+12120557143');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (11,'Taeyeon','Taeyeon','Kim','+441989030907');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (12,'Charli XCX','Charlotte','Aitchison','+19922062011');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (13,'ARCA','Alejandra','Ghersi','+13101304997');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (14,'Pink','Alecia','Moore','+19184567893');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (15,'Caroline Polachek','Caroline','Polachek','+17252285100');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (16,'Rina Sawayama','Rina','Sawayama','+441430950680');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (17,'Nate Ruess','Nathaniel','Ruess','+13649973311');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (18,'The Nationals','Aaron','Dessner','+9113458901');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (19,'Safety Trance','Luis','Valdeon','+12021235432');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (20,'DPR Live','Dabin','Hong','+823277699100');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (21,'Lana Del Rey','Elizabeth','Grant','+12347594398');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (22,'Phoebe Bridgers','Phoebe','Bridgers','+17704321377');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (23,'Tom Odell','Thomas','Odell','+447859151875');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (24,'Pomme','Claire','Geo','+33486656897');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (25,'Tiffany Young','Stephanie','Hwang','+13207237264');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (26,'Christine and the Queens','Heloise','Letissier','+33937934358');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (27,'Sam Smith','Samuel','Smith','+447965174429');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (28,'Tiesto','Tijs','Verwest','+31387230884');
INSERT INTO `artist` (`artist_id`,`artistic_name`,`first_name`,`last_name`,`phone`) VALUES (29,'Saweetie','Diamonte','Valentin','+17343498060');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (1,'DREAM PERFECT REGIME DPR');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (2,'Universal Music Group');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (3,'Dead Oceans');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (4,'Decca');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (5,'Republic Records');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (6,'Warner Music Group');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (7,'Independent Artist');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (8,'XL Recordings');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (9,'Double Double Whammy');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (10,'The Orchard');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (11,'SM Entertainment');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (12,'All Of the Above Nacional Records');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (13,'Matador Records');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (14,'BlockBerry Creative');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (15,'RCA Records');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (16,'Dirty Hit');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (17,'Fueled by Ramen');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (18,'4AD');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (19,'Club Romantico');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (20,'LOEN Entertainment');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (21,'Saddest Factory Records');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (22,'Polydor');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (23,'Because Music');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (24,'Capitol Records');
INSERT INTO `record_label` (`rl_id`,`rl_name`) VALUES (25,'Spinnin Records');
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (2,1);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (7,2);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (21,2);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (25,2);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (4,3);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (10,4);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (6,5);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (12,6);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (29,6);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (1,7);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (23,7);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (13,8);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (5,9);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (15,10);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (11,11);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (8,12);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (3,13);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (9,14);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (14,15);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (16,16);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (17,17);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (18,18);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (19,19);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (20,20);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (22,21);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (24,22);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (26,23);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (27,24);
INSERT INTO `record_label_artist` (`artist_id`,`rl_id`) VALUES (28,25);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (1,'Atlantic Records Group LLC','USA',6);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (2,'Interscope','USA',2);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (3,'Decca Group','UK',2);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (4,'Chop Shop Records','USA',6);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (5,'Galactic Records','UK',5);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (6,'Asylum Records','USA',6);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (7,'Mercury Records','US',6);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (8,'Young','UK',8);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (9,'X5 Music Group','Sweden',6);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (10,'AshesToFlame Records','India',10);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (11,'SM True','Thailand',11);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (12,'FNC Entertainment','South Korea',6);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (13,'Spinnin Records','Netherlands',6);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (14,'Woollim Entertainment','South Korea',11);
INSERT INTO `branch` (`branch_id`,`branch_name`,`location`,`rl_id`) VALUES (15,'Bluebird Records','US',15);
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (1,'La fiesta del rey drama',3459,2016,'00:36:41');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (2,'Moodswings In To Order',6007,2022,'00:23:11');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (3,'the record',53000,2023,'00:42:18');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (4,'Jubilee',8000,2021,'00:37:03');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (5,'The land is inhospitable and so are we',4200,2023,'00:32:22');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (6,'evermore',1700000,2021,'01:09:00');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (7,'Minor',3500,2020,'00:20:12');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (8,'All My Demons Greeting Me As a Friend',100000,2016,'01:04:00');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (9,'Caribe Caribe',5000,2023,'00:52:54');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (10,'Flip That',130840,2022,'00:17:11');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (11,'INVU',308315,2022,'00:42:26');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (12,'True Romance',12000,2013,'00:47:06');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (13,'KICK ii',8940,2021,'00:34:01');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (14,'Funhouse',6000000,2008,'00:48:38');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (15,'PANG',23000,2019,'00:46:37');
INSERT INTO `album` (`album_id`,`title`,`sales`,`release_year`,`album_length`) VALUES (16,'Moodswings In This Order',15999,2021,'00:23:11');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (1,'Emilia','00:03:08');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (2,'Estoy Afuera Sal','00:03:08');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (3,'Cuidame','00:03:44');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (4,'Ballroom Extravaganza','00:03:09');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (5,'Mood','00:03:02');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (6,'Nerves','00:03:15');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (7,'True Blue','00:04:56');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (8,'Not Strong Enough','00:03:54');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (9,'Cool About It','00:03:00');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (10,'Posing for Cars','00:06:38');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (11,'Be Sweet','00:03:40');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (12,'Slide Tackle','00:03:39');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (13,'I Don\'\'t Like My Mind','00:02:25');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (14,'I\'\'m Your Man','00:03:29');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (15,'My Love Mine All Mine','00:02:17');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (16,'Tolerate It','00:04:05');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (17,'Right Where You Left Me','00:04:05');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (18,'I Miss You I\'\'m Sorry','00:02:48');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (19,'Runaway','00:04:08');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (20,'Grins','00:03:52');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (21,'Rakata','00:02:31');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (22,'Aleros Pompeii','00:04:00');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (23,'Sober','00:04:11');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (24,'Door','00:05:22');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (25,'Cold as Hell','00:02:44');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (26,'POSE','00:03:06');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (27,'Welcome to My Island Remix','00:03:22');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (28,'Beg For You','00:02:48');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (29,'Just Give Me a Reason','00:04:02');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (30,'The Alcott','00:04:27');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (31,'El Alma Que Te Trajo','00:02:24');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (32,'Boom','00:03:21');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (33,'Snow on the Beach','00:03:49');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (34,'Nothing New','00:04:18');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (35,'Butterflies','00:02:10');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (36,'Everything Matters','00:03:33');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (37,'Gee','00:03:21');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (38,'La Vita Nuova','00:04:28');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (39,'In The City','00:02:56');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (40,'Hot in It','00:02:09');
INSERT INTO `song` (`song_id`,`title`,`duration`) VALUES (41,'OUT OUT','00:02:42');
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (2,32,2021);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (2,33,2023);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (2,34,2021);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (6,30,2023);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (10,35,2023);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (10,36,2022);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (11,37,2010);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (12,27,2023);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (12,28,2022);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (12,39,2023);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (12,40,2022);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (12,41,2021);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (13,31,2022);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (14,29,2012);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (15,27,2023);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (15,38,2020);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (16,28,2022);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (17,29,2012);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (18,30,2023);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (19,31,2022);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (20,32,2021);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (21,33,2023);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (22,34,2021);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (23,35,2023);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (24,36,2022);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (25,37,2010);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (26,38,2020);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (27,39,2023);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (28,40,2022);
INSERT INTO `featuring` (`artist_id`,`song_id`,`release_date`) VALUES (29,41,2021);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (1,'Independent','Venezuela',1);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (2,'DPR','South Korea',2);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (3,'Interscope Geffen A and M','USA',3);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (4,'Secretly Distribution','USA',4);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (5,'Secretly Group','USA',5);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (6,'Island EMI','UK',6);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (7,'Polydor','UK',7);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (8,'Decca Music Group','UK',8);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (9,'Warner Chappell Mexico','Mexico',9);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (10,'WM Korea','South Korea',10);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (11,'SM Entertainment','South Korea',11);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (12,'Atlantic Records Group','UK',12);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (13,'BEGGARS Group','UK',13);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (14,'Legacy Recordings','USA',14);
INSERT INTO `distribuitor` (`dist_id`,`dist_name`,`country`,`album_id`) VALUES (15,'Perpetual Novice','USA',15);
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (1,'pop rock');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (2,'indie pop');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (3,'new wave');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (4,'disco');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (5,'alternative RnB');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (6,'indie folk');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (7,'indie rock');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (8,'chamber pop');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (9,'dream pop');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (10,'folk');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (11,'americana');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (12,'folk pop');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (13,'ballad pop');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (14,'folktronica');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (15,'synth pop');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (16,'experimental');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (17,'avant pop');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (18,'pop');
INSERT INTO `genre` (`genre_id`,`music_genre`) VALUES (19,'dance');
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (1,1);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (2,1);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (14,1);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (1,2);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (4,2);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (1,3);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (16,5);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (3,6);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (6,6);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (3,7);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (9,7);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (4,8);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (5,10);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (6,12);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (7,13);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (12,15);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (13,16);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (11,18);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (10,19);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (2,4);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (4,9);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (5,11);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (8,14);
INSERT INTO `album_genre` (`album_id`,`genre_id`) VALUES (15,17);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (1,1);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (1,2);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (1,3);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (2,4);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (2,5);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (16,6);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (3,7);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (3,8);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (3,9);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (4,10);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (4,11);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (4,12);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (5,13);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (5,14);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (5,15);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (6,16);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (6,17);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (7,18);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (8,19);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (12,20);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (13,21);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (9,22);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (14,23);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (15,24);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (11,25);
INSERT INTO `album_song` (`album_id`,`song_id`) VALUES (10,26);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (4,1);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (1,2);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (2,3);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (16,3);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (3,4);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (5,8);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (6,9);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (7,10);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (8,11);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (12,12);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (13,13);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (9,14);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (14,15);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (15,16);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (11,17);
INSERT INTO `album_producer` (`album_id`,`pd_id`) VALUES (10,18);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (1,1);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (2,2);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (16,2);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (3,3);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (4,4);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (5,5);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (6,6);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (7,7);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (9,8);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (10,9);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (8,10);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (11,11);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (12,12);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (13,13);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (14,14);
INSERT INTO `album_artist` (`album_id`,`artist_id`) VALUES (15,15);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (1,1);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (4,1);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (23,1);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (2,2);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (11,2);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (3,3);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (5,4);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (6,5);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (7,6);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (9,6);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (17,6);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (8,7);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (22,7);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (10,8);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (12,9);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (13,10);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (14,10);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (15,11);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (16,12);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (18,13);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (19,14);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (20,15);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (21,16);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (24,17);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (25,18);
INSERT INTO `song_genre` (`song_id`,`genre_id`) VALUES (26,19);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (1,1);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (2,1);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (3,1);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (4,2);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (5,2);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (6,2);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (7,3);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (8,3);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (9,3);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (10,4);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (11,4);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (12,4);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (13,5);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (14,5);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (15,5);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (16,6);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (17,6);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (18,7);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (22,8);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (26,9);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (19,10);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (25,11);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (20,12);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (21,13);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (23,14);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (24,15);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (27,15);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (28,16);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (29,17);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (30,18);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (31,19);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (32,20);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (33,21);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (34,22);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (35,23);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (36,24);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (37,25);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (38,26);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (39,27);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (40,28);
INSERT INTO `song_artist` (`song_id`,`artist_id`) VALUES (41,29);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (10,1);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (12,1);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (1,2);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (2,2);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (3,2);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (4,3);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (5,3);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (6,3);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (32,3);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (7,4);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (8,5);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (9,6);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (11,7);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (13,8);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (14,8);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (15,8);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (16,9);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (17,9);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (30,9);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (34,9);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (18,10);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (19,11);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (36,11);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (20,12);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (21,13);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (31,13);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (22,14);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (23,15);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (24,16);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (25,17);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (26,18);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (27,19);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (28,20);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (29,21);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (33,23);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (35,24);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (37,25);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (38,26);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (39,27);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (40,28);
INSERT INTO `song_producer` (`song_id`,`pd_id`) VALUES (41,29);

-- SELECT * from producer;
-- SELECT * from artist;
-- SELECT * from album;
-- SELECT * from album_artist;
-- SELECT * from album_genre;
-- SELECT * from album_producer;
-- SELECT * from album_song;
-- SELECT * from branch;
-- SELECT * from genre;
-- SELECT * from distribuitor;
-- SELECT * from featuring;
-- SELECT * from record_label;
-- SELECT * from record_label_artist;
-- SELECT * from song;
-- SELECT * FROM song_artist;
-- SELECT * FROM song_genre;
-- SELECT * FROM song_producer;

-- SELECT a.artistic_name,rl.rl_name FROM artist a
-- LEFT JOIN record_label_artist rla ON a.artist_id = rla.artist_id
-- LEFT JOIN record_label rl ON rla.rl_id = rl.rl_id ORDER BY rl.rl_name;

--  SELECT AA.album_id,artist_id,title FROM album_artist AA
-- LEFT JOIN album a ON AA.album_id = a.album_id;

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
-- DROP SCHEMA IF EXISTS pf_vilchez;
CREATE SCHEMA IF NOT EXISTS pf_vilchez;
USE pf_vilchez;

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
    pd_name VARCHAR(25),
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

CREATE TABLE IF NOT EXISTS song_producer
(
	song_id INT NOT NULL,
    pd_id INT NOT NULL,
    PRIMARY KEY(song_id,pd_id),
    CONSTRAINT fk_sp_song FOREIGN KEY (song_id) REFERENCES song(song_id),
    CONSTRAINT fk_sp_pd FOREIGN KEY (pd_id) REFERENCES producer(pd_id)
);

CREATE TABLE IF NOT EXISTS featuring
(
	artist_id INT NOT NULL,
    song_id INT NOT NULL,
    release_date YEAR,
    PRIMARY KEY (artist_id,song_id),
    CONSTRAINT fk_ft_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
	CONSTRAINT fk_ft_song FOREIGN KEY(song_id) REFERENCES song(song_id)
);

CREATE TABLE IF NOT EXISTS album_song
(
	album_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY(album_id,song_id),
    CONSTRAINT fk_as_album FOREIGN KEY (album_id) REFERENCES album(album_id),
    CONSTRAINT fk_as_song FOREIGN KEY (song_id) REFERENCES song(song_id)
);

CREATE TABLE IF NOT EXISTS album_producer
(
	album_id INT NOT NULL,
    pd_id INT NOT NULL,
    PRIMARY KEY(album_id,pd_id),
    CONSTRAINT fk_ap_album FOREIGN KEY (album_id) REFERENCES album(album_id),
    CONSTRAINT fk_ap_pd FOREIGN KEY (pd_id) REFERENCES producer(pd_id)
);

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

CREATE TABLE IF NOT EXISTS album_genre
(
	album_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY(album_id,genre_id),
    CONSTRAINT fk_ag_album FOREIGN KEY (album_id) REFERENCES album(album_id),
    CONSTRAINT fk_ag_genre FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

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
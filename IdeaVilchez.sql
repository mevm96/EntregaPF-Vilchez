-- DROP SCHEMA IF EXISTS ch_pf_vilchez;
CREATE SCHEMA IF NOT EXISTS ch_pf_vilchez;
USE ch_pf_vilchez;

CREATE TABLE IF NOT EXISTS artist 
(
	artist_id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    phone VARCHAR(15) NOT NULL,
    PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS record_label
(
	rl_id INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(30) UNIQUE,
    artist_id INT NOT NULL,
    PRIMARY KEY (rl_id),
    KEY artist_id(artist_id),
    CONSTRAINT fk_rl_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id)
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
    name VARCHAR(30) UNIQUE,
    location VARCHAR(30),
    rl_id INT NOT NULL,
    PRIMARY KEY (branch_id),
    KEY rl_id(rl_id),
    CONSTRAINT fk_rl FOREIGN KEY(rl_id) REFERENCES record_label(rl_id)
);

CREATE TABLE IF NOT EXISTS producer
(
	pd_id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    phone VARCHAR(15) NOT NULL,
    gender ENUM('F','M','N'),
    DOB DATE, -- Date of Birth
    Nationality VARCHAR(30),
    PRIMARY KEY (pd_id)
);

CREATE TABLE IF NOT EXISTS album
(
	album_id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(30),
    sales INT,
    release_year DATE,
    album_length TIME,
    PRIMARY KEY (album_id)
);

-- Songs: Individual songs, with artists and producers associated.
CREATE TABLE IF NOT EXISTS song
(
	song_id INT AUTO_INCREMENT NOT NULL,
    title VARCHAR(100),
    song_length TIME,
    artist_id INT NOT NULL,
    pd_id INT NOT NULL,
    PRIMARY KEY (song_id),
    KEY artist_id(artist_id),
    CONSTRAINT fk_song_artist FOREIGN KEY(artist_id) REFERENCES artist(artist_id),
    KEY pd_id(pd_id),
    CONSTRAINT fk_song_pd FOREIGN KEY(pd_id) REFERENCES producer(pd_id)
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
    title VARCHAR(100),
    release_date DATE,
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
    distribuitor_name VARCHAR(30) UNIQUE,
    country VARCHAR(30),
	album_id INT NOT NULL,
    PRIMARY KEY (dist_id),
    KEY album_id(album_id),
    CONSTRAINT fk_dist_album FOREIGN KEY (album_id) REFERENCES album(album_id)
);

-- Music Genres: Info about music genres, with albums and songs associated.
CREATE TABLE IF NOT EXISTS genre
(
	genre_id INT AUTO_INCREMENT NOT NULL,
	music_genre TEXT,
	album_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (genre_id),
    KEY album_id(album_id),
    CONSTRAINT fk_genre_album FOREIGN KEY (album_id) REFERENCES album(album_id),
    KEY song_id(song_id),
    CONSTRAINT fk_genre_song FOREIGN KEY (song_id) REFERENCES song(song_id)
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
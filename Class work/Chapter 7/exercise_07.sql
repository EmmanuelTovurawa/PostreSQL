#1

CREATE TABLE albums(
	album_id bigserial CONSTRAINT album_id_key PRIMARY KEY,
	album_catalog_code varchar(100) ,
	album_title text NOT NULL,
	album_artist text NOT NULL,
	album_release_date date NOT NULL,
	album_genre varchar(40) NOT NULL,
	album_description text,
	CONSTRAINT albbum_catalog_code_unique UNIQUE (album_catalog_code)
);

CREATE TABLE songs(
	song_id bigserial CONSTRAINT song_id_pk PRIMARY KEY,
	song_title text NOT NULL,
	song_artist text NOT NULL,
	album_id bigint REFERENCES albums(album_id)
);


#2
Yes, album_catalog_code can be used as a natural key. The album_catalog_code is a unique identifier.


#3
The album_id and album_catalog_code are good candidates for indexes because they are unique.
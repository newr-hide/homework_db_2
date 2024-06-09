CREATE TABLE IF NOT EXISTS genre(
id_genre SERIAL PRIMARY KEY,
title VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS band(
id_band SERIAL PRIMARY KEY,
name_band VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS bridge_genre_band(
id_band INTEGER REFERENCES band(id_band),
id_genre INTEGER REFERENCES genre(id_genre),
PRIMARY KEY(id_band, id_genre)
);

CREATE TABLE IF NOT EXISTS album(
id_album SERIAL PRIMARY KEY,
title VARCHAR(60) NOT NULL,
album_year INT CHECK(album_year >= 1900)
);

CREATE TABLE IF NOT EXISTS bridge_band_album(
id_band INTEGER REFERENCES band(id_band),
id_album INTEGER REFERENCES album(id_album),
PRIMARY KEY(id_band, id_album)
);

CREATE TABLE IF NOT EXISTS music_track(
id_track SERIAL PRIMARY KEY,
name_track VARCHAR(60) NOT NULL,
duration INT CHECK(duration >= 0),
id_album INTEGER REFERENCES album(id_album)
);

CREATE TABLE IF NOT EXISTS collection_of_song(
id_collection SERIAL PRIMARY KEY,
title VARCHAR(60) NOT NULL,
year_collection INT CHECK(year_collection >= 1900)
);

CREATE TABLE IF NOT EXISTS bridge_collection_tracks(
id_track INTEGER REFERENCES music_track(id_track),
id_collection INTEGER REFERENCES collection_of_song(id_collection),
PRIMARY KEY(id_track, id_collection)
);
--2 Задание
-- Название и продолжительность самого длительного трека
SELECT name_track, duration AS "Продолжительность" 
FROM music_track
WHERE duration = (SELECT max(duration) FROM music_track);

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT name_track
FROM music_track
WHERE duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title
FROM collection_of_song  
WHERE year_collection BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT name_band
FROM band
WHERE LENGTH(REPLACE(band.name_band,' ','')) = LENGTH(band.name_band);

SELECT name_band
FROM band
WHERE name_band NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my»

SELECT name_track
FROM music_track mt 
WHERE (name_track LIKE '%my%') OR (name_track  LIKE  '%мой%');

--3 задание

-- Количество исполнителей в каждом жанре.
SELECT title AS "Название", count(*) AS "Количество"
FROM genre
JOIN bridge_genre_band bgb ON bgb.id_genre = genre.id_genre
GROUP BY title;

--Количество треков, вошедших в альбомы 2019–2020 годов


SELECT album.title AS "Название альбома" , COUNT(id_track) AS "Количество"
FROM music_track
JOIN album ON album.id_album = music_track.id_album 
WHERE album.album_year BETWEEN 2019 AND 2020
GROUP BY album.title; 

--Средняя продолжительность треков по каждому альбому
SELECT album.title, ROUND(AVG(duration),2) AS avg_duration
FROM music_track 
JOIN album ON album.id_album = music_track.id_album 
GROUP BY album.title 
ORDER BY avg_duration DESC;

--Все исполнители, которые не выпустили альбомы в 2020 году

SELECT DISTINCT band.name_band
FROM band
WHERE name_band NOT IN (SELECT name_band
	FROM album 
	JOIN bridge_band_album bba ON bba.id_album = album.id_album
	JOIN band b ON b.id_band = bba.id_band
	WHERE album_year = 2020);



-- Название сборника в котором присутствует определенный исполнитель








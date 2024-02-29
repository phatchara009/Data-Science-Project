SELECT * FROM artists, albums
WHERE artists.artistid = albums.artistid;

SELECT * FROM artists JOIN albums
ON artists.artistid = albums.artistid;

---------------------------------------------------------

SELECT 
	artists.artistid,
	artists.name AS artist_name,
	albums.title AS album_name
FROM artists, albums
WHERE artists.artistid = albums.artistid -- PK = FK
	AND artists.artistid IN (8, 100, 120);
	
---------------------------------------------------------
	
SELECT 
	artists.artistid,
	artists.name AS artist_name,
	albums.title AS album_name,
	tracks.name AS song_name
FROM artists, albums, tracks
WHERE artists.artistid = albums.artistid -- PK = FK
	AND albums.albumid = tracks.albumid -- PK = FK
	AND artists.artistid IN (8, 100, 120);
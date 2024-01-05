-- UPPER

SELECT * FROM customers
WHERE UPPER(country) = 'CANADA';

------------------------------------------------------------

-- OR

SELECT * FROM customers
WHERE customerid = 29 OR customerid = 30;

------------------------------------------------------------

-- BETWEEN 

SELECT * FROM customers
WHERE customerid BETWEEN 29 AND 40;

------------------------------------------------------------

-- IN

SELECT * FROM customers
WHERE country IN ('Germany', 'France');

------------------------------------------------------------

-- IS NULL and IS NOT NULL

SELECT * FROM customers
WHERE company IS NULL;

SELECT * FROM customers
WHERE company IS NOT NULL;

------------------------------------------------------------

-- Join table by WHERE clause

SELECT * FROM artists, albums
WHERE artists.artistid = albums,artistid;

SELECT 
	artists.artistid,
	artists.name,
	albums.title
FROM artists, albums
WHERE artists.artistid = albums.artistid; -- PK = FK

SELECT 
	A.artistid ID,
	A.name artistName,
	B.title albumName
FROM artists A, albums B
WHERE A.artistid = B.artistid; -- PK = FK

------------------------------------------------------------

-- LIKE with Wild cards (%) (Pattern Matching)

SELECT 
	A.artistid ID,
	A.name artistName,
	B.title albumName
FROM artists A, albums B
WHERE A.artistid = B.artistid -- PK = FK
	AND A.name LIKE 'C%'
	AND B.title LIKE '%C';

------------------------------------------------------------

-- INNER JOIN clause
SELECT 
	A.artistid ID,
	A.name artistName,
	B.title albumName
FROM artists A 
JOIN albums B
ON A.artistid = B.artistid -- PK = FK
	AND A.name LIKE 'C%'
	AND B.title LIKE '%C';

------------------------------------------------------------

-- Ex: Join 4 tables

-- WHERE clause
SELECT 
	artists.ArtistID ArtistID,
	artist.Name ArtistName,
	albums.Title AlbumName,
	tracks.Name Song,
	genres.Name GenreName
FROM artists, albums, tracks, genres
WHERE artists.artistid = albums.artistid
	AND albums.albumid = tracks.albumid
	AND tracks.genreid = genres.genreid;

-- JOIN ON clause
SELECT 
	artists.ArtistID ArtistID,
	artist.Name ArtistName,
	albums.Title AlbumName,
	tracks.Name Song,
	genres.Name GenreName
FROM artists 
JOIN albums ON artists.artistid = albums.artistid
JOIN tracks ON albums.albumid = tracks.albumid
JOIN genres ON tracks.genreid = genres.genreid
WHERE albums.Title LIKE '%The %' AND genres.Name = 'Rock';

------------------------------------------------------------

-- Aggregate function
SELECT
	AVG(milliseconds / 60000.0) AS avg_min,
	SUM(milliseconds / 60000.0) AS sum_min,
	MIN(milliseconds / 60000.0) AS max_min,
	MAX(milliseconds / 60000.0) AS min_min, 
	COUNT(milliseconds / 60000.0) AS count_min -- count not NULL values
FROM tracks;

------------------------------------------------------------

-- COUNT(*) — Count rows of table
-- For check number of missing values
SELECT COUNT(*), COUNT(company) FROM customers;

------------------------------------------------------------

-- ORDER BY
SELECT 
	country
	COUNT(*) N_CUST, 
FROM customers
GROUP BY country
ORDER BY N_CUST;

SELECT 
	country
	COUNT(*) N_CUST, 
FROM customers
GROUP BY country
ORDER BY N_CUST DESC;

------------------------------------------------------------

-- GROUP BY
SELECT 
	country
	COUNT(*) N_CUST, 
FROM customers
GROUP BY 1
ORDER BY 2 DESC;

------------------------------------------------------------

SELECT
	A.name AS GenreName,
	COUNT(B.Name) AS N_Tracks
FROM genres A, tracks B
WHERE A.genreid = B.genreid
GROUP BY A.Name
ORDER BY N_Tracks DESC;

SELECT
	A.name AS GenreName,
	COUNT(B.Name) AS N_Tracks
FROM genres A, tracks B
WHERE A.genreid = B.genreid
GROUP BY 1
ORDER BY 2 DESC;

------------------------------------------------------------

-- Join, Group by
SELECT
	A.name AS GenreName,
	COUNT(B.Name) AS N_Tracks
FROM genres A
JOIN tracks B ON A.genreid = B.genreid
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

------------------------------------------------------------

-- Inner Join
SELECT
	A.name AS ArtistName,
	COUNT(B.titles) AS N_Albums
FROM genres A
INNER JOIN albums B ON A.artistid= B.artistid
GROUP BY A.name
ORDER BY COUNT(B.title) DESC
LIMIT 10;
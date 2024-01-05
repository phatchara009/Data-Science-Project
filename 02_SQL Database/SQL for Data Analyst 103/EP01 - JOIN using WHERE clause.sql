-- join tables using WHERE clause
SELECT * FROM artists, albums
WHERE artists.artistid = albums.artistid;

-- using alias
SELECT 
	A.artistid,
	A.Name artistName,
	B.Title albumName
FROM artists A, albums B
WHERE A.artistid = B.artistid
	AND A.Name LIKE 'C%';
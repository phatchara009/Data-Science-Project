SELECT 
	country, 
	COUNT(*) AS count_country
FROM customers
GROUP BY country
ORDER BY count_country DESC
LIMIT 5;

SELECT 
	genres.name genre_name, 
	tracks.name track_name
FROM genres, tracks
WHERE genres.genreid = tracks.genreid
ORDER BY RANDOM() DESC
LIMIT 10;

SELECT 
	genres.name, 
	COUNT(*) AS count_songs
FROM genres, tracks
WHERE genres.genreid = tracks.genreid
GROUP BY genres.name
ORDER BY count_songs DESC
LIMIT 5;
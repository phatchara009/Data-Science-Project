SELECT 
	genres.name, 
	COUNT(*) 
FROM genres, tracks
WHERE genres.genreid = tracks.genreid
GROUP BY genres.name
ORDER BY COUNT(*)
LIMIT 5;

SELECT 
	genres.name, 
	COUNT(*) 
FROM genres, tracks
WHERE genres.genreid = tracks.genreid
GROUP BY genres.name
ORDER BY COUNT(*) DESC
LIMIT 5;
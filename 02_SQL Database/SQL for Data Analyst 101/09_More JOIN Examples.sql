SELECT
	art.artistid,
	art.name,
	alb.title,
	tra.name,
	tra.composer
FROM artists AS art
JOIN albums AS alb
ON art.ArtistId = alb.artistid
JOIN tracks AS tra
ON alb.albumid = tra.albumid
WHERE art.name = 'Aerosmith';
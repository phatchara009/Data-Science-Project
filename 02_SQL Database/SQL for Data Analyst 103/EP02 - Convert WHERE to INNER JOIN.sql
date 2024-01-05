SELECT
	A.Name,
	COUNT(*) Aerosmith_Songs
FROM artists A
INNER JOIN albums B ON A.artistid = B.artistid
INNER JOIN tracks C ON B.albumid = C.albumid 
WHERE A.Name LIKE 'A%'
GROUP BY A.Name
ORDER BY Aerosmith_Songs DESC
LIMIT 5;
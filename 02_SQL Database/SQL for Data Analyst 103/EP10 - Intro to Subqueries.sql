---------------------------------------------------------------------

SELECT * FROM tracks ORDER BY milliseconds DESC LIMIT 1;

SELECT MAX(milliseconds) FROM tracks;

-- basic subqueries in WHERE clause
SELECT * FROM tracks 
WHERE milliseconds = (SELECT MAX(milliseconds) FROM tracks);

---------------------------------------------------------------------

SELECT * 
FROM customers 
WHERE country = 'USA'

SELECT firstname, lastname, country FROM
	(SELECT * 
	FROM customers 
	WHERE country = 'USA');
	
---------------------------------------------------------------------

SELECT AVG(milliseconds) FROM tracks;

SELECT COUNT(*) FROM tracks 
WHERE milliseconds >= (SELECT AVG(milliseconds) FROM tracks);

---------------------------------------------------------------------
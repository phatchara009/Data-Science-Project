SELECT * FROM customers;

SELECT firstname, lastname, company, country FROM customers LIMIT 5;

SELECT 
	firstname, 
	lastname,
	firstname || ' ' || lastname,
	firstname || SUBSTR(lastname, 1, 1) || '@fullstack.com' AS email
FROM customers LIMIT 5;

SELECT 
	firstname, 
	lastname,
	firstname || ' ' || lastname,
	UPPER(firstname) || SUBSTR(lastname, 1, 1) || '@fullstack.com' AS email
FROM customers LIMIT 5;

SELECT
	name,
	ROUND(milliseconds / 60000.0, 2) AS minutes,
	ROUND(bytes / (1024*1024.0), 2) AS mb
FROM tracks;

SELECT CAST('100' AS INT);
SELECT CAST('100.0' AS REAL);
SELECT CAST(100 AS TEXT);
SELECT CAST('Hello World' AS REAL);

SELECT 
	invoicedate,
	STRFTIME('%Y', invoicedate) AS YEAR,
	STRFTIME('%m', invoicedate) AS month,
	STRFTIME('%d', invoicedate) AS day
FROM invoices
WHERE month = '04' AND YEAR = '2009';

SELECT 
	invoicedate,
	CAST(STRFTIME('%Y', invoicedate) AS INT) AS YEAR,
	CAST(STRFTIME('%m', invoicedate) AS INT) AS month,
	CAST(STRFTIME('%d', invoicedate) AS INT) AS day
FROM invoices
WHERE YEAR < 2013 AND month > 6;

SELECT 
	invoicedate,
	STRFTIME('%Y-%m', invoicedate) AS monthid
FROM invoices
WHERE monthID = '2013-06';

SELECT * FROM customers
WHERE UPPER(country) IN ('UNITED KINGDOM', 'USA', 'CANADA');

SELECT firstname, lastname FROM customers
WHERE UPPER(country) IN ('UNITED KINGDOM', 'USA', 'CANADA');

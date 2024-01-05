SELECT * FROM customers
WHERE country = 'Brazil' OR country = 'Germany' OR country = 'Norway';

SELECT * FROM customers
WHERE country IN ('Brazil', 'Germany', 'Norway');

SELECT * FROM customers
WHERE NOT(country = 'Brazil' OR country = 'Germany' OR country = 'Norway');

SELECT * FROM customers
WHERE country NOT IN ('Brazil', 'Germany', 'Norway');

SELECT * FROM customers
WHERE customerid >= 5 AND customerid <= 10;

SELECT * FROM customers
WHERE customerid BETWEEN 5 and 10;

SELECT invoicedate FROM invoices
WHERE invoicedate BETWEEN '2009-01-01 00:00:00' AND '2009-01-31 20:00:00'; 

SELECT * FROM customer
WHERE company IS NULL;

SELECT * FROM customer
WHERE company IS NOT NULL;

-- Don't use
/*
SELECT * FROM customer
WHERE company = NULL;
*/
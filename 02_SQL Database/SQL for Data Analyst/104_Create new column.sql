SELECT 
	firstname, 
	lastname, 
	firstname || " " || lastname AS fullname,
	UPPER(firstname) || "@company.com" AS email
FROM customers;

-- ใส่ .0 เพื่อให้มั่นใจว่าเป็นประเภท Float
SELECT 
	name, 
	round(Milliseconds / 60000.0, 2) AS minute, 
	round(Bytes / (1024*1024.0), 2) AS mb
FROM tracks;
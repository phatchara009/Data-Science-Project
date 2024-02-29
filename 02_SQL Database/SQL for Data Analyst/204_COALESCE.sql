SELECT 
	company,
	COALESCE(company, 'End Customer') AS 'Company Clean'
FROM customers;

SELECT 
	company,
	COALESCE(company, 'End Customer') AS 'Company Clean',
	CASE WHEN company IS NULL THEN 'End Customer'
		ELSE 'Coperate'
	END AS 'Segment'
FROM customers;
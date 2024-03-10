SELECT 
	InvoiceDate,
	CAST(STRFTIME('%Y', invoicedate) AS INT) AS year
FROM invoices
WHERE year = 2013;
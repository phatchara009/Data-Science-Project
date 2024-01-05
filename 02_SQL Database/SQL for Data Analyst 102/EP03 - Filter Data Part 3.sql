SELECT firstname, lastname, country, email FROM customers
WHERE email LIKE '%@gmail.com' AND country = 'USA';

SELECT firstname, lastname, country, email FROM customers
WHERE email LIKE '%@hotmail.com' AND country = 'United Kingdom';

SELECT firstname, lastname, country, email FROM customers
WHERE NOT(email LIKE '%@gmail.com' AND country = 'USA');


SELECT firstname, lastname, country, email, phone FROM customers
WHERE phone LIKE '%99%';


SELECT firstname, lastname, country, email, phone FROM customers
WHERE first LIKE 'J_hn';
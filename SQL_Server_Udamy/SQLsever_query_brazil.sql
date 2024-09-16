--SELECT * FROM customers;

--SELECT * FROM geolocation;

--SELECT * FROM orders
--WHERE YEAR(order_purchase_timestamp) = 2017;

--SELECT * FROM order_items
--WHERE YEAR(shipping_limit_date) BETWEEN 2017 AND 2018;

--SELECT * FROM order_items
--WHERE shipping_limit_date BETWEEN '2017-01-01' AND '2018-12-31'
--ORDER BY shipping_limit_date ASC;

--SELECT COUNT(DISTINCT product_category_name) FROM products;

--SELECT COUNT(DISTINCT product_category_name) FROM products;

--SELECT * FROM products
--WHERE product_category_name IS NULL;

--SELECT 
--	product_category_name,
--	COALESCE(product_category_name, 'non_category') AS new_product_category_name
--FROM products
--WHERE product_category_name IS NULL;

--TRUNCATE TABLE dbo.temp;
--INSERT INTO dbo.temp
--SELECT 
--	product_category_name,
--	CASE
--		WHEN product_category_name IS NOT NULL THEN 'Have Category'
--		WHEN product_category_name IS NULL THEN 'Dont have category'
--	END AS segment
--FROM products
--ORDER BY product_category_name ASC;

--CREATE VIEW cat_name AS
--	SELECT 
--		product_category_name,
--		CASE
--			WHEN product_category_name IS NOT NULL THEN 'Have Category'
--			WHEN product_category_name IS NULL THEN 'Dont have category'
--		END AS segment
--	FROM products;
--GO

--SELECT * FROM cat_name;
--GO

SELECT TOP (10)
	product_id Product,
	ROUND(SUM(price), 0) Sum_Price,
	ROUND(SUM(order_item_id), 0) Sum_Quantity,
	ROUND(SUM((Price + freight_value) * order_item_id), 0) Sum_Order_value
FROM dbo.order_items
WHERE YEAR(shipping_limit_date) = 2018
GROUP BY product_id
ORDER BY Sum_Order_value DESC;
GO

WITH 
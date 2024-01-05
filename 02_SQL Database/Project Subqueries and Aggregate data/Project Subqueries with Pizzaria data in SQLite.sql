-- Create customer information table.
CREATE TABLE customers (
  customer_id INT UNIQUE,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  phone_num VARCHAR(10),
  gender VARCHAR(10),
  jobs VARCHAR(100),
  address_id VARCHAR(5)
);

INSERT INTO customers VALUES 
  (1, "Toy", "Datarockie", "0988888888", "M", "Data Analyst", "10110"), 
  (2, "Alfred", "Evans", "0908781220", "M", "Data Scientist", "10600"), 
  (3, "Nelly", "Franklin", "0671881399", "F", "Investment Banking", "10510"), 
  (4, "Bredford", "Fowler", "0919229038", "M", "Financial Advisor", "10510"), 
  (5, "Marry", "Smith", "0817899878", "F", "Fund Manager", "10400");

SELECT * FROM customers;

--------------------------------------------------------------------------------------

-- Create pizza menus table.
CREATE TABLE pizza_menus (
  menu_id INT UNIQUE,
  name TEXT,
  price REAL
);

INSERT INTO pizza_menus VALUES
  ("M01", "Pepperoni", 249.0),
  ("M02", "Hawaiian", 199.0),
  ("M03", "BBQ Chicken", 199.0),
  ("M04", "Seafood Island", 249.0),
  ("M05", "Vegetarian", 199.0),
  ("M06", "Extreme Cheese", 249.0),
  ("M07", "MEAT Lover", 249.0),
  ("M08", "Bacon and Ham", 249.0);

SELECT * FROM pizza_menus;

--------------------------------------------------------------------------------------

-- Create order table. 
CREATE TABLE orders (
  order_id TEXT,
  menu_id TEXT,
  quantity INT,
  order_date TEXT,
  customer_id INT
);

INSERT INTO orders VALUES 
  ("0001", "M01", 2, "2023-09-01", 1),
  ("0001", "M02", 1, "2023-09-01", 1),
  ("0002", "M05", 1, "2023-09-10", 2),
  ("0002", "M06", 1, "2023-09-10", 2),
  ("0003", "M03", 3, "2023-09-17", 5),
  ("0004", "M04", 1, "2023-09-30", 3),
  ("0004", "M07", 1, "2023-09-30", 3),
  ("0004", "M08", 1, "2023-09-30", 3),
  ("0005", "M08", 1, "2023-10-05", 4),
  ("0005", "M05", 1, "2023-10-05", 4),
  ("0006", "M01", 2, "2023-10-05", 2),
  ("0006", "M06", 2, "2023-10-05", 2),
  ("0007", "M03", 1, "2023-10-10", 5),
  ("0008", "M04", 1, "2023-10-10", 3),
  ("0008", "M07", 1, "2023-10-10", 3);

SELECT * FROM orders;

--------------------------------------------------------------------------------------

-- Join table to get information of each order.
SELECT 
  ord.order_id AS order_id,
  ord.order_date AS order_date,
  cus.firstname AS name,
  cus.phone_num AS phone,
  cus.address_id AS address_id,
  piz.name AS menu,
  piz.price AS price,
  ord.quantity AS quantity
FROM orders AS ord
LEFT JOIN customers AS cus 
  ON cus.customer_id = ord.customer_id
LEFT JOIN pizza_menus AS piz 
  ON ord.menu_id = piz.menu_id
ORDER BY 1, 2, 7;

--------------------------------------------------------------------------------------

-- Find Total Revenue of each order.

-- *Basic* Queries 1: Total value per order
SELECT 
  ord.order_id AS order_id,
  ord.order_date AS order_date,
  cus.firstname AS Name,
  cus.phone_num AS Phone,
  cus.address_id AS Address,
  (SUM(piz.price * ord.quantity) * 1.07) + 60 AS Revenue
FROM orders AS ord
LEFT JOIN pizza_menus AS piz 
  ON ord.menu_id = piz.menu_id
LEFT JOIN customers AS cus 
  ON cus.customer_id = ord.customer_id
WHERE STRFTIME("%Y-%m", ord.order_date) = "2023-10" AND cus.address_id LIKE "105%"
GROUP BY 1
ORDER BY 2, 1;

-- *WITH* Queries 1: Total value per order
WITH orders_2023_oct AS (
  SELECT 
    ord.order_id AS order_id,
    ord.order_date AS order_date,
    piz.name AS menu_name,
    piz.price,
    ord.quantity,
    piz.price * ord.quantity AS total_price,
    ord.customer_id AS customer_id
  FROM orders AS ord
  LEFT JOIN pizza_menus AS piz
    ON ord.menu_id = piz.menu_id
  WHERE STRFTIME("%Y-%m", ord.order_date) = "2023-10"
), customers_add105 AS (
  SELECT 
    customer_id,
    firstname AS Name,
    phone_num AS Phone,
    address_id AS Address
  FROM customers AS cus
  WHERE cus.address_id LIKE "105%"
)
SELECT 
  order_id,
  order_date,
  Name,
  Phone,
  Address,
  (SUM(total_price) * 1.07) + 60 AS Revenue
FROM orders_2023_oct AS tb1
INNER JOIN customers_add105 AS tb2 
  ON tb1.customer_id = tb2.customer_id
GROUP BY 1
ORDER BY 2, 1;

--------------------------------------------------------------------------------------

-- Find Total Revenue per year and month.
-- *WITH* Queries 2: Revenue by Monthid
WITH orders_month AS (
  SELECT 
    STRFTIME("%Y-%m", order_date) AS monthid,
    menu_id, 
    quantity
  FROM orders
), pizza AS (
  SELECT * FROM pizza_menus
)
  
SELECT 
  monthid AS Year_Month,
  (SUM(tb1.quantity * tb2.price) * 1.07) + 60 AS Revenue
FROM orders_month AS tb1
LEFT JOIN pizza AS tb2 
  ON tb1.menu_id = tb2.menu_id
GROUP BY 1
ORDER BY 1;

--------------------------------------------------------------------------------------

-- Find Top 3 best-selling pizzas.
-- *WITH* Queries 3: Top 3 Pizza menu
WITH order_quantity AS (
  SELECT 
    menu_id, 
    quantity
  FROM orders
), pizza_name AS (
  SELECT 
    menu_id, 
    name
  FROM pizza_menus
)
SELECT
  name AS Pizza,
  SUM(quantity) AS Purchase_amount
FROM order_quantity AS ord
LEFT JOIN pizza_name AS piz
  ON ord.menu_id = piz.menu_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

--------------------------------------------------------------------------------------
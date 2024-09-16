--CREATE TABLE Order_Summary (
--	Order_No INT PRIMARY KEY NOT NULL,
--	Order_Date DATE,
--	Total_Price DECIMAL(10, 2),
--	Customer_Email VARCHAR(100)
--)

TRUNCATE TABLE Order_Summary;
GO
INSERT INTO Order_Summary (Order_No, Order_Date, Total_Price, Customer_Email)
VALUES
	(1015572, '2021/02/25', 15000, 'Jctst@gmail.com'),
	(1015573, '2021/02/25', 4000, 'appes3@gmail.com');
GO

---------------------------------------------------------------------------------------

--CREATE TABLE Order_Details (
--	Transaction_ID VARCHAR(25) PRIMARY KEY NOT NULL,
--	Order_No INT NOT NULL,
--	Product_ID INT NOT NULL,
--	No_of_Unit INT NOT NULL
--)

TRUNCATE TABLE Order_Details;
GO
INSERT INTO Order_Details (Transaction_ID, Order_No, Product_ID, No_of_Unit)
VALUES
	('JAN012021116', 1015572, 403, 1),
	('JAN012021117', 1015572, 404, 2);
GO

---------------------------------------------------------------------------------------

--CREATE TABLE Product_Catalog (
--	Product_ID INT PRIMARY KEY NOT NULL,
--	Product_Name NVARCHAR(200) NOT NULL,
--	Product_Group NVARCHAR(200) NOT NULL,
--	Unit_Price DECIMAL(10,2) NOT NULL
--)

TRUNCATE TABLE Product_Catalog;
GO
INSERT INTO Product_Catalog (Product_ID, Product_Name, Product_Group, Unit_Price)
VALUES
	(403, 'โต๊ะทานอาหาร', 'ห้องครัว', 5000),
	(404, 'เก้าอี้ทานอาหาร', 'ห้องครัว', 2000);
GO

---------------------------------------------------------------------------------------
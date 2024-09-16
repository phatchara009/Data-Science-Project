--SELECT
--	Order_Date,
--	COUNT(Order_No) Count_Order_No, 
--	SUM(Total_Price) Sum_Total_Price
--FROM Order_Summary
--GROUP BY Order_Date;
--GO

--SELECT
--	od.Product_ID,
--	os.Order_Date,
--	SUM(od.No_of_Unit) Total_Unit
--FROM Order_Summary os
--LEFT JOIN Order_Details od ON os.Order_No = od.Order_No
--GROUP BY os.Order_Date, od.Product_ID;

SELECT
	os.Customer_Email,
	MONTH(os.Order_Date) [Month],
	pc.Product_Group,
	SUM(od.No_of_Unit) Total_Unit
FROM Order_Summary os
LEFT JOIN Order_Details od 
	ON os.Order_No = od.Order_No
LEFT JOIN Product_Catalog pc
	ON od.Product_ID = pc.Product_ID
WHERE Customer_Email = 'Jctst@gmail.com'
GROUP BY os.Customer_Email, MONTH(os.Order_Date), pc.Product_Group
ORDER BY [Month];
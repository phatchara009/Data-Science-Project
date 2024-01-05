-- WHEN คือ เงื่อนไข (Condition)
-- THEN คือ ผลลัพธ์ (Value)
-- ELSE คือ เงื่อนไขอื่นๆ นอกเหนือจากที่กำหนด

-- ถ้าใส่ชื่อบริษัทมา Assume ว่าเป็น Coperate (B2B)
-- ถ้าไม่ใส่ชื่อบริษัทมา Assume ว่าเป็น Customer (B2C)
SELECT 
  company,
  CASE
    WHEN company IS NOT NULL THEN 'Corperate'
	ELSE 'End Customer'
  END AS segment
FROM customers;

SELECT 
  country,
  CASE
    WHEN country IN ('Canada', 'USA') THEN 'America'
    WHEN country IN ('Belgium', 'France', 'Italy') THEN 'Europe'
    ELSE 'Other'
  END AS region
FROM customers;
/*-- create a new book shop table
CREATE TABLE book_shop_new (
  	id INT,
  	name TEXT,
	 	release_year INT
  );

INSERT INTO book_shop_new VALUES
  (6, 'Business Data Science', 2020),
  (7, 'Subliminal', 2018),
  (8, 'Good Strategy Bad Strategy', 2015);*/


-- union old and new book shop then sorted by year
SELECT * FROM book_shop
UNION
SELECT * FROM book_shop_new
ORDER BY 3 DESC;

-- union old and new book shop then sorted by year
SELECT * FROM book_shop
UNION ALL
SELECT * FROM book_shop_new
ORDER BY 3 DESC;

	
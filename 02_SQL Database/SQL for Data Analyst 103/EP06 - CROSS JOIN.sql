-- create two tables: ranks and suits
-- reference: https://www.sqlitetutorial.net/sqlite-cross-join/
CREATE TABLE ranks (
    rank TEXT NOT NULL
);

CREATE TABLE suits (
    suit TEXT NOT NULL
);

INSERT INTO ranks(rank) 
VALUES('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9'),('10'),('J'),('Q'),('K'),('A');

INSERT INTO suits(suit) 
VALUES('Clubs'),('Diamonds'),('Hearts'),('Spades');

SELECT * FROM ranks;
SELECT * FROM suits;

-- cross join both tables to create a full card deck
SELECT * FROM ranks 
CROSS JOIN suits 
ORDER BY suit;
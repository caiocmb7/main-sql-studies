--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2608
DROP TABLE products;
DROP DATABASE IF EXISTS URI_db;
CREATE DATABASE URI_db;
USE URI_db;

CREATE TABLE products (
  id numeric PRIMARY KEY,
  name varchar(50),
  amount numeric,
  price numeric(7,2)
);

INSERT INTO products (id, name, amount, price)
VALUES
  (1,	'Two-doors wardrobe',	100,	800),
  (2,	'Dining table',	1000,	560),
  (3,	'Towel holder',	10000,	25.50),
  (4,	'Computer desk',	350,	320.50),
  (5,	'Chair',	3000,	210.64),
  (6,	'Single bed',	750,	460);
  
SELECT 
    MAX(price) as price,
    MIN(price) as price
FROM products;
  

DROP TABLE products;
     
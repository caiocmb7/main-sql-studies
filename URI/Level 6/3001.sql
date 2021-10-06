--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 3001

DROP TABLE products;
DROP DATABASE IF EXISTS URI_db;
CREATE DATABASE URI_db;
USE URI_db;

CREATE TABLE products (
id numeric PRIMARY KEY,
name varchar(50),
type char,
price numeric
);

GRANT SELECT ON products TO sql_user;

INSERT INTO products (id , name, type, price)
VALUES
(1, 'Monitor',  'B', 0),
(2, 'Headset',  'A', 0),
(3, 'PC Case',  'A', 0),
(4, 'Computer Desk', 'C', 0),
(5, 'Gaming Chair', 'C', 0),
(6, 'Mouse',  'A', 0);

select 
    name as type,
    CASE when type = 'A' then 20.0
         when type = 'B' then 70.0
         else 530.5
    END as price
from products order by products.type, products.id desc;
/* sol 1
UPDATE products
    SET price = 20
    ORDER BY type
    LIMIT 3;

UPDATE products
    SET price = 70
    ORDER BY price ASC
    LIMIT 1;

UPDATE products
    SET price = 530.5
    ORDER BY type DESC
    LIMIT 2;

SELECT 
    name AS type,
    price
FROM products
ORDER BY price ASC;

*/

/* sol 2
UPDATE products
    SET price = 20
    WHERE type = 'A';

UPDATE products
    SET price = 70
    WHERE type = 'B'; 

UPDATE products
    SET price = 530.5
    WHERE type = 'C';
    
SELECT 
    name AS type,
    price
FROM products
ORDER BY type ASC;
*/
    

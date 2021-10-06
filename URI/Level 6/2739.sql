--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2739
  
DROP TABLE loan; --
DROP DATABASE IF EXISTS URI_db;
CREATE DATABASE URI_db;
USE URI_db;

CREATE TABLE loan(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  value_Test NUMERIC,
  payday TIMESTAMP
 );

INSERT INTO loan(id, name, value_Test, payday)
VALUES (1, 'Cristian Ghyprievy', 3000.50, '2017-10-19'),
       (2, 'John Serial', 10000, '2017-10-10'),
       (3, 'Michael Seven', 5000.40, '2017-10-17'),
       (4, 'Joana Cabel', 2000, '2017-10-05'),
       (5, 'Miguel Santos', 4050, '2017-10-20');

SELECT
    name,
    CAST(EXTRACT(DAY FROM payday) AS INT) AS day 
FROM loan;
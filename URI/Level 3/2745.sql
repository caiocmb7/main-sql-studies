--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2745

DROP TABLE people; --
DROP DATABASE IF EXISTS URI_db;
CREATE DATABASE URI_db;
USE URI_db;

CREATE TABLE people (
  id INTEGER PRIMARY KEY,
  name CHARACTER VARYING (255),
  salary NUMERIC
);


INSERT INTO people(id, name, salary)
VALUES 
      (1, 'James M. Tabarez', 883),
      (2, 'Rafael T. Hendon', 4281),
      (3, 'Linda J. Gardner', 4437),
      (4, 'Nicholas J. Conn', 8011),
      (5, 'Karol A. Morales', 2508),
      (6, 'Lolita S. Graves', 8709);

SELECT 
    name,
    ROUND(salary * 0.1, 2) AS tax_value
FROM people
WHERE salary > 3000;

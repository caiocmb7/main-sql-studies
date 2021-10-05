--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2616

DROP TABLE locations, customers; --
DROP DATABASE IF EXISTS URI_db;
CREATE DATABASE URI_db;
USE URI_db;

CREATE TABLE customers (
  id numeric PRIMARY KEY,
  name varchar(50),
  street varchar(50),
  city varchar(50)
);


CREATE TABLE locations (
  id numeric PRIMARY KEY,
  locations_date date,
  id_customers numeric REFERENCES customers (id)
);

INSERT INTO customers (id, name, street, city)
VALUES
  (1,	'Giovanna Goncalves Oliveira',	'Rua Mato Grosso',	'Canoas'),
  (2,	'Kauã Azevedo Ribeiro',	'Travessa Ibiá',	'Uberlândia'),
  (3,	'Rebeca Barbosa Santos',	'Rua Observatório Meteorológico',	'Salvador'),
  (4,	'Sarah Carvalho Correia',	'Rua Antônio Carlos da Silva',	'Apucarana'),
  (5,	'João Almeida Lima',	'Rua Rio Taiuva',	'Ponta Grossa'),
  (6,	'Diogo Melo Dias',	'Rua Duzentos e Cinqüenta',	'Várzea Grande');
  

INSERT INTO locations (id , locations_date, id_customers)
VALUES
  (1,	'09/10/2016',	3),
  (2,	'02/09/2016',	1),
  (3,	'02/08/2016',	4),
  (4,	'02/09/2015',	2),
  (5,	'02/03/2016',	6),
  (6,	'04/04/2016',	4);
  
SELECT 
    customers.id,
    customers.name
FROM customers 
LEFT JOIN locations
    ON locations.id_customers = customers.id
WHERE locations.id_customers IS NULL;   

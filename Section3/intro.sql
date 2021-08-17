#mysql-ctl cli

CREATE DATABASE shop;

USE shop;

SHOW DATABASES;

CREATE TABLE pastries(
    name VARCHAR(100),
    quantity INT
);

DESC pastries;

DROP TABLE pastries;


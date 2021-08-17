CREATE DATABASE cats_db;

USE cats_db;

CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);

INSERT INTO cats(name,age)
VALUES("Astrogilda",9);

INSERT INTO cats(age, name)
VALUES(5,"Menezes");

INSERT INTO cats(name, age)
VALUES  ("Gloria", 11), 
        ("Fiorentino", 13), 
        ("Tranquilo", 2);


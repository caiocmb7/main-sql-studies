CREATE DATABASE trash_stuff;

USE trash_stuff;

CREATE TABLE people(
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
);

INSERT INTO people
VALUES("Tina", "Belcher", 13);

INSERT INTO people
VALUES("Bob", "Belcher", 42);

INSERT INTO people
VALUES("A", "A_LASTNAME", 12), ("B", "B_LASTNAME", 13), ("C", "C_LASTNAME", 55);

SELECT * FROM people;




/* nao permitir que coloque dados nulos */

USE trash_stuff;

CREATE TABLE peoplev2(
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT NOT NULL
);

DESC peoplev2;



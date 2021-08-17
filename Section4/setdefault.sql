/*setar valores padroes caso nao receba valores atribuidos */

USE trash_stuff;

CREATE TABLE peoplev3(
    first_name VARCHAR(20) DEFAULT "no name provided",
    last_name VARCHAR(20) NOT NULL,
    age INT DEFAULT 100,
    test VARCHAR(20) NOT NULL DEFAULT "teste"
);

DESC peoplev3;



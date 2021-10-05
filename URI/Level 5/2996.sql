--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2996

DROP TABLE packages;
DROP TABLE users;
DROP DATABASE IF EXISTS URI_db;
CREATE DATABASE URI_db;
USE URI_db;

CREATE TABLE users (
id integer PRIMARY KEY,
name varchar(50),
address varchar(50)
);

GRANT SELECT ON users TO sql_user;

CREATE TABLE packages (
id_package integer PRIMARY KEY,
id_user_sender integer,
id_user_receiver integer,
color varchar(50),
year_date integer,
FOREIGN KEY (id_user_sender) REFERENCES users(id),
FOREIGN KEY (id_user_receiver) REFERENCES users(id)
);

GRANT SELECT ON packages TO sql_user;

insert into users (id,name,address) values
(1,'Edgar Codd','England'),
(2,'Peter Chen','Taiwan'),
(3,'Jim Gray','United States'),
(4,'Elizabeth ONeil','United States');

insert into packages (id_package,id_user_sender,id_user_receiver,color,year_date) values
(1,1,2,'blue',2015),
(2,1,3,'blue',2019),
(3,2,4,'red',2019),
(4,2,1,'green',2018),
(5,3,4,'red',2015),
(6,4,3,'blue',2019);

-- troquei a variavel 'year' para 'year_date' para conseguir rodar no MySQL
SELECT
    year_date,
    users_sender.name as sender,
    users_receiver.name as receiver
FROM packages
INNER JOIN users users_sender
    ON users_sender.id = packages.id_user_sender
INNER JOIN users users_receiver
    ON users_receiver.id = packages.id_user_receiver
WHERE (packages.color = 'blue' or packages.year_date = 2015) AND (users_receiver.address) NOT IN ('Taiwan') AND (users_sender.address) NOT IN ('Taiwan')
ORDER BY year_date DESC; 

/* para rodar no URI

SELECT
    year,
    users_sender.name as sender,
    users_receiver.name as receiver
FROM packages
INNER JOIN users users_sender
    ON users_sender.id = packages.id_user_sender
INNER JOIN users users_receiver
    ON users_receiver.id = packages.id_user_receiver
WHERE (packages.color = 'blue' or packages.year = 2015) AND (users_receiver.address) NOT IN ('Taiwan') AND (users_sender.address) NOT IN ('Taiwan')
ORDER BY year DESC;

*/

/*

SELECT
    year_date,
    CASE 
        WHEN users.id = packages.id_user_sender THEN users.name
    END AS sender,
    CASE 
        WHEN users.id = packages.id_user_receiver THEN users.name
    END AS receiver
FROM packages
INNER JOIN users
    ON users.id = packages.id_user_sender OR users.id = packages.id_user_receiver
WHERE (packages.color = 'blue' or packages.year_date = 2015) AND (users_receiver.address) NOT IN ('Taiwan') AND (users_sender.address) NOT IN ('Taiwan')
ORDER BY year_date;

*/
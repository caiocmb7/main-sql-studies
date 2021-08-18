USE trash_stuff;

CREATE TABLE store(
    shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(20),
    color VARCHAR(20),
    shirt_size VARCHAR(3),
    last_worn INT
);

INSERT INTO store(article, color, shirt_size, last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

INSERT INTO store(article, color, shirt_size, last_worn) 
VALUES("t-shirt", "Purple", "M", 50);

DESC store;

SELECT article, color FROM store;

SELECT article, color, shirt_size, last_worn FROM store 
WHERE shirt_size = "M";

UPDATE store SET shirt_size = "L"
WHERE article = "polo shirt";

SELECT * FROM store;

UPDATE store SET last_worn = 0
WHERE last_worn = 15;

SELECT * FROM store;

DELETE FROM store WHERE last_worn = 200;

DELETE FROM store WHERE article = 'tank top';

DELETE FROM store WHERE article = "t-shirt";

DELETE FROM store WHERE article = "polo shirt";

INSERT INTO store(article, color, shirt_size, last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

INSERT INTO store(article, color, shirt_size, last_worn) 
VALUES("t-shirt", "Purple", "M", 50);

DELETE FROM store;

DESC store;

DROP TABLE store;




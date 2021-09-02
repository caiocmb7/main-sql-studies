/*We've created a database for a documents app, with rows for each document with it's title, content, and author. In this first step, use UPDATE to change the author to
 'Jackie Draper' for all rows where it's currently 'Jackie Paper'. Then re-select all the rows to 
 make sure the table changed like you expected. */

CREATE TABLE clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    design TEXT);
    
INSERT INTO clothes (type, design)
    VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
    VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
    VALUES ("blazer", "black sequin");

ALTER TABLE clothes ADD price INTEGER;

SELECT * FROM clothes;

UPDATE clothes SET price = 10 WHERE id = 1;
UPDATE clothes SET price = 20 WHERE id = 2;
UPDATE clothes SET price = 30 WHERE id = 3;

SELECT * FROM clothes;

INSERT INTO clothes (type, design, price) VALUES ("a", "boo-o", 50);

SELECT * FROM clothes;


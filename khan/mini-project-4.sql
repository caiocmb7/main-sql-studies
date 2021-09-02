/* Think about your favorite apps, and pick one that stores your data- like a game that stores scores, an app that lets you post updates, etc. Now in this project, you're going to imagine that the app stores your data in a SQL database (which is pretty likely!), and write SQL statements that might look like their own SQL.

CREATE a table to store the data.
INSERT a few example rows in the table.
Use an UPDATE to emulate what happens when you edit data in the app.
Use a DELETE to emulate what happens when you delete data in the app. */

CREATE TABLE computer_things (id INTEGER, name TEXT, price INTEGER, color TEXT, usage TEXT, rating INTEGER);

INSERT INTO computer_things VALUES (1, "Mouse", 100, "Black", "New", 100);
INSERT INTO computer_things VALUES (2, "Monitor", 1000, "White", "Used", 50);
INSERT INTO computer_things VALUES (3, "Keyboard", 150, "Black", "New", 80);
INSERT INTO computer_things VALUES (4, "Keyboard", 150, "Pink", "New", 100);
INSERT INTO computer_things VALUES (5, "Keyboard", 150, "Pink", "New", 100);
INSERT INTO computer_things VALUES (6, "Sound stuffs", 1200, "Black", "New", 10);
INSERT INTO computer_things VALUES (7, "Monitor", 1000, "White", "Used", 50);
INSERT INTO computer_things VALUES (8, "RTX", 7000, "Black", "New", 23);
INSERT INTO computer_things VALUES (9, "Mobo", 2200, "Black", "New", 44);
INSERT INTO computer_things VALUES (10, "Cabinet", 200, "Yellow", "New", 69);
INSERT INTO computer_things VALUES (11, "MousePad", 1070, "Brown", "New", 60);
INSERT INTO computer_things VALUES (12, "Mouse", 1090, "Black", "New", 70);
INSERT INTO computer_things VALUES (13, "USB cable", 1002, "Purple", "New", 10);
INSERT INTO computer_things VALUES (14, "Headphone", 170, "Black", "New", 55);
INSERT INTO computer_things VALUES (15, "Microphone", 5100, "Black", "New", 24);

SELECT * FROM computer_things;

INSERT INTO computer_things VALUES (5, "Microphone", 500, "Yellow", "New", 24);

SELECT * FROM computer_things;

UPDATE computer_things SET color = "Blue" 
    WHERE name == "Keyboard" and rating == 80;
    
SELECT * FROM computer_things;

ALTER TABLE computer_things ADD comment TEXT default "Nothing to say";

INSERT INTO computer_things VALUES (3555, "Smartphone", 5040, "White", "New", 24, "Beautiful stuff");

SELECT * FROM computer_things;

DELETE FROM computer_things WHERE id = 2;

SELECT * FROM computer_things;






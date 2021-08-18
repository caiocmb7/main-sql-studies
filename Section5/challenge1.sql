USE cats_db;

SELECT breed FROM cats 
WHERE cat_id = 1;

SELECT * FROM cats 
WHERE name='egG';

SELECT name, age FROM cats
WHERE breed = "Tabby";

SELECT cat_id, age FROM cats
WHERE cat_id = age;
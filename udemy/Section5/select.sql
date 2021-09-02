CREATE TABLE cats 
  ( 
     cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
     name   VARCHAR(100), 
     breed  VARCHAR(100), 
     age    INT
  ); 

DESC cats;

SELECT cats_id, name, breed FROM cats;
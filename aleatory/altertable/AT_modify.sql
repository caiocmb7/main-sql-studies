USE trash_stuff;

ALTER TABLE estudo
MODIFY COLUMN num_float DECIMAL(5,2) NOT NULL;

DESC estudo;
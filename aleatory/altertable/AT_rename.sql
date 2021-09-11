USE trash_stuff;

ALTER TABLE estudo
CHANGE num_float num_decimal DECIMAL(5,2) NOT NULL;

DESC estudo;
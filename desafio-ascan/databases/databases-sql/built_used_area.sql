DROP DATABASE IF EXISTS desafio_ascan;
CREATE DATABASE desafio_ascan;
USE desafio_ascan; 

CREATE TABLE built_used_area_table (
    listing_id INTEGER, # I thought that listing_id is Primary Key, but in .csv there are repeatable values
    built_area FLOAT DEFAULT 0,
    used_area INTEGER DEFAULT 0
);


LOAD DATA LOCAL INFILE  '/workspace/mysql/desafio-ascan/Built_used_area.csv'
INTO TABLE built_used_area_table
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



/*
LOAD DATA LOCAL INFILE '/workspace/mysql/desafio-ascan/Built_used_area.csv'
INTO TABLE built_used_area_table 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(listing_id, built_area, used_area);
*/
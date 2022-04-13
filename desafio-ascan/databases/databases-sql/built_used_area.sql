DROP DATABASE IF EXISTS desafio_ascan;
CREATE DATABASE desafio_ascan;
USE desafio_ascan; 

CREATE TABLE built_used_area_table (
    listing_id INTEGER PRIMARY KEY, # I thought that listing_id is Primary Key, but in .csv there are repeatable values
    built_area FLOAT,
    used_area INTEGER
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
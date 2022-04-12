DROP DATABASE IF EXISTS desafio_ascan;
CREATE DATABASE desafio_ascan;
USE desafio_ascan; 

CREATE TABLE details_table (
    listing_id INTEGER,
    Details VARCHAR(512) PRIMARY KEY
    #FOREIGN KEY(listing_id) REFERENCES built_used_area_table(listing_id)
);


LOAD DATA LOCAL INFILE  '/workspace/mysql/desafio-ascan/Details.csv'
INTO TABLE details_table
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
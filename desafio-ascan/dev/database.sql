DROP DATABASE IF EXISTS desafio_ascan;
CREATE DATABASE desafio_ascan;
USE desafio_ascan; 

CREATE TABLE built_used_area_table (
    listing_id INTEGER PRIMARY KEY,
    built_area INTEGER NOT NULL DEFAULT 0,
    used_area INTEGER DEFAULT 0
);

CREATE TABLE details_table (
    details VARCHAR(255) PRIMARY KEY,
    listing_id INTEGER,
    FOREIGN KEY(listing_id) REFERENCES built_used_area_table(listing_id)
);

CREATE TABLE price_changes_table (
    listing_id INTEGER NOT NULL,
    old_price BIGINT NOT NULL,
    new_price BIGINT NOT NULL,
    change_date DATE NOT NULL,
    details VARCHAR(255) NOT NULL,
    FOREIGN KEY(listing_id) REFERENCES built_used_area_table(listing_id),
    FOREIGN KEY(details) REFERENCES details_table(details)
);

LOAD DATA LOCAL INFILE '/workspace/mysql/desafio-ascan/Built_used_area.csv'
INTO TABLE built_used_area_table 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(listing_id, built_area, used_area);

LOAD DATA LOCAL INFILE '/workspace/mysql/desafio-ascan/Details.csv'
INTO TABLE details_table
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(listing_id, Details);

LOAD DATA LOCAL INFILE '/workspace/mysql/desafio-ascan/Price_changes.csv'
INTO TABLE price_changes_table 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(listing_id, old_price, new_price, change_date, Details);
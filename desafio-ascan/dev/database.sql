DROP DATABASE IF EXISTS desafio_ascan;
CREATE DATABASE desafio_ascan;
USE desafio_ascan; 

# 5506 para 4137 rows por conta do drop_duplicates
CREATE TABLE built_used_area_table (
    listing_id INTEGER PRIMARY KEY,
    built_area FLOAT,
    used_area FLOAT
);

# como details referencia built_used_area_table, só irá pegar os listing_id que contém na outra tabela, por isso que sai de 2410 para 807 rows
CREATE TABLE details_table (
    details VARCHAR(1000) PRIMARY KEY,
    listing_id INTEGER,
    FOREIGN KEY(listing_id) REFERENCES built_used_area_table(listing_id)
);

CREATE TABLE price_changes_table (
    listing_id INTEGER,
    old_price FLOAT,
    new_price BIGINT,
    change_date DATE,
    details VARCHAR(1000),
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
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(listing_id, old_price, new_price, change_date, Details);
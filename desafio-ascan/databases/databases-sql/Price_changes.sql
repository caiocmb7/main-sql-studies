USE desafio_ascan; 

CREATE TABLE price_changes_table (
    listing_id INTEGER,
    old_price INTEGER,
    new_price INTEGER,
    change_date DATE,
    Details VARCHAR(255),
    FOREIGN KEY(listing_id) REFERENCES built_used_area_table(listing_id),
    FOREIGN KEY(details) REFERENCES details_table(details)
);


LOAD DATA LOCAL INFILE  '/workspace/mysql/desafio-ascan/Price_changes.csv'
INTO TABLE price_changes_table
FIELDS TERMINATED BY '    ' 
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
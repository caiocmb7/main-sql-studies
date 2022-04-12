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
SELECT 
    listing_id,
    COUNT(listing_id),
    built_area,
    COUNT(built_area),
    used_area,
    COUNT(used_area) 
FROM built_used_area_table
GROUP BY
    listing_id,
    built_area,
    used_area
HAVING 
    COUNT(listing_id) > 1 AND
    COUNT(built_area) > 1 AND
    COUNT(used_area) > 1;
    
CREATE TABLE built_used_area_no_duplicates SELECT DISTINCT listing_id, built_area, used_area FROM built_used_area_table;
DROP TABLE built_used_area_table;
ALTER TABLE built_used_area_no_duplicates RENAME TO built_used_area_table;

SELECT * FROM built_used_area_table;
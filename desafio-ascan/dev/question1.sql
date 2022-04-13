# new price > old price : price_changes
# data = 2016 : price_changes
# used_area > 200 : built_used_area
# average 

/* 

comando principal: 


SELECT
    price_changes_table.old_price,
    price_changes_table.new_price,
    price_changes_table.change_date,
    built_used_area_table.used_area
FROM price_changes_table
INNER JOIN built_used_area_table
    ON price_changes_table.listing_id = built_used_area_table.listing_id
WHERE 
    price_changes_table.new_price > price_changes_table.old_price AND     # clause 1
    used_area > 200 AND     # clause 2
    year(change_date) = 2016     # clause 3
    
query para identificar o valor médio:

SELECT
    ROUND(AVG(price_changes_table.new_price),2) as average_square
FROM price_changes_table
INNER JOIN built_used_area_table
    ON price_changes_table.listing_id = built_used_area_table.listing_id
WHERE 
    price_changes_table.new_price > price_changes_table.old_price AND     # clause 1
    used_area > 200 AND     # clause 2
    year(change_date) = 2016     # clause 3

*/

# query

SELECT
    ROUND(AVG((price_changes_table.new_price / built_used_area_table.used_area)),2) as average_square_meter
FROM price_changes_table
INNER JOIN built_used_area_table
    ON price_changes_table.listing_id = built_used_area_table.listing_id
WHERE 
    price_changes_table.new_price > price_changes_table.old_price AND     # clause 1
    used_area > 200 AND     # clause 2
    year(change_date) = 2016     # clause 3
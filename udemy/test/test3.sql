SELECT 
rating,
series_id
FROM reviews
WHERE rating > 7 AND series_id = 2 OR series_id = 5;

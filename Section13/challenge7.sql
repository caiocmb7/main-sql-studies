SELECT 
title, 
rating, 
CONCAT(first_name, ' ', last_name) AS reviewer
FROM reviews
JOIN reviewers
    ON reviews.reviewer_id = reviewers.id
JOIN series
    ON reviews.series_id = series.id
ORDER BY title;
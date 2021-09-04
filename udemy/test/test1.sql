SELECT 
title,
genre,
SUM(rating) AS sum_rating
FROM series
INNER JOIN reviews
    ON reviews.series_id = series.id
        WHERE (genre = "Comedy" OR genre = "Drama") AND rating > 7
GROUP BY title;
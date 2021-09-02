SELECT series.title, AVG(reviews.rating) AS avg_rating 
FROM series
JOIN reviews
    ON reviews.series_id = series.id
    GROUP BY series.id
    ORDER BY AVG(reviews.rating);

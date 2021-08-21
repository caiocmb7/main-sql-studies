SELECT series.title, reviews.rating FROM series
JOIN reviews
    ON reviews.series_id = series.id;
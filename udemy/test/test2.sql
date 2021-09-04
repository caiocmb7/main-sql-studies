SELECT 
*
FROM series
INNER JOIN reviews
    ON reviews.series_id = series.id
        WHERE (series.released_year = 2000 OR series.released_year = 1989 OR series.released_year = 1999) AND rating > 8;
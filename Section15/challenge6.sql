SELECT
    tag_name,
    COUNT(*) AS qtd
FROM photo_tags
INNER JOIN photos
    ON photos.id = photo_tags.photo_id
INNER JOIN tags
    ON tags.id = photo_tags.tag_id
GROUP BY tag_name
ORDER BY qtd DESC
LIMIT 5;
    



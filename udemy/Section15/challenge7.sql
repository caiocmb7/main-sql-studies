SELECT
    username,
    COUNT(*) AS qtd
FROM likes
INNER JOIN photos
    ON likes.photo_id = photos.id
INNER JOIN users
    ON likes.user_id = users.id
GROUP BY likes.user_id
HAVING qtd = (SELECT Count(*) FROM photos);





SELECT
    username, 
    image_url,
    COUNT(*) AS total_likes
FROM photos
JOIN likes
    ON photos.id = likes.photo_id
JOIN users
    ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY total_likes DESC
LIMIT 3;



/*

SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 5;

*/

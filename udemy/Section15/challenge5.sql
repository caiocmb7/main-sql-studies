
SELECT
    username,
    COUNT(image_url) AS total_posts,
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg_posts
FROM photos
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.user_id
ORDER BY total_posts DESC;


SELECT 
    username,
    photo_id,
    comment_text,
    RANK() OVER(ORDER BY comment_text) AS most_comments
FROM users
INNER JOIN comments
    ON comments.user_id = users.id
INNER JOIN photos
    ON photos.user_id = users.id
LIMIT 5;
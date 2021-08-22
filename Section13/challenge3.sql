SELECT first_name, last_name, rating
FROM reviews
JOIN reviewers
    ON reviews.reviewer_id = reviewers.id;
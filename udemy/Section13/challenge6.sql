/* construcao da coluna COUNT */

SELECT 
first_name,
last_name,
COUNT(reviews.reviewer_id) AS COUNT
FROM reviewers
LEFT JOIN reviews
    ON reviews.reviewer_id = reviewers.id
    GROUP BY reviewers.id;

/* construcao da coluna MIN */

SELECT 
first_name,
last_name,
MIN(reviews.rating) AS MIN
FROM reviewers
LEFT JOIN reviews
    ON reviews.reviewer_id = reviewers.id
    GROUP BY reviewers.id;


/* construcao da coluna MAX */

SELECT 
first_name,
last_name,
MAX(reviews.rating) AS MAX
FROM reviewers
LEFT JOIN reviews
    ON reviews.reviewer_id = reviewers.id
    GROUP BY reviewers.id;

/* construcao da coluna AVG */

SELECT 
first_name,
last_name,
AVG(reviews.rating) AS AVG
FROM reviewers
LEFT JOIN reviews
    ON reviews.reviewer_id = reviewers.id
    GROUP BY reviewers.id;

/* construcao da coluna STATUS */

SELECT 
first_name,
last_name,
CASE
    WHEN COUNT(reviews.reviewer_id) > 0 THEN "ACTIVE"
    ELSE
    "INACTIVE"
    END
    AS STATUS
FROM reviewers
LEFT JOIN reviews
    ON reviews.reviewer_id = reviewers.id
    GROUP BY reviewers.id;

/* tudo junto */

SELECT 
first_name,
last_name,
COUNT(reviews.reviewer_id) AS COUNT,
IFNULL(MIN(reviews.rating), 0) AS MIN,
IFNULL(MAX(reviews.rating), 0) AS MAX,
IFNULL(AVG(reviews.rating), 0) AS AVG,
CASE
    WHEN COUNT(reviews.reviewer_id) > 0 THEN "ACTIVE"
    ELSE
    "INACTIVE"
    END
    AS STATUS
FROM reviewers
LEFT JOIN reviews
    ON reviews.reviewer_id = reviewers.id
    GROUP BY reviewers.id;
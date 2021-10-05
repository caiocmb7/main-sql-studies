--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2740

DROP TABLE league; --
DROP DATABASE IF EXISTS URI_db;
CREATE DATABASE URI_db;
USE URI_db;

CREATE TABLE league(
  position INTEGER,
  team CHARACTER VARYING (255)
);


INSERT INTO league(position, team)
VALUES (1, 'The Quack Bats'),
       (2, 'The Responsible Hornets'),
       (3, 'The Bawdy Dolphins'),
       (4, 'The Abstracted Sharks'),
       (5, 'The Nervous Zebras'),
       (6, 'The Oafish Owls'),
       (7, 'The Unequaled Bison'),
       (8, 'The Keen Kangaroos'),
       (9, 'The Left Nightingales'),
       (10, 'The Terrific Elks'),
       (11, 'The Lumpy Frogs'),
       (12, 'The Swift Buffalo'),
       (13, 'The Big Chargers'),
       (14, 'The Rough Robins'),
       (15, 'The Silver Crocs');

/*
SELECT 
    CASE
        WHEN league.position IN (1, 2, 3) THEN concat('Podium: ', league.team)
        WHEN league.position IN (14, 15) THEN concat('Demoted: ', league.team)
    END AS name
FROM league;
WHERE name IS NOT NULL;
*/


SELECT
    *
FROM (
    SELECT 
        CASE
            WHEN league.position IN (1, 2, 3) THEN concat('Podium: ', league.team)
            WHEN league.position IN (14, 15) THEN concat('Demoted: ', league.team)
        END AS name
    FROM league
) AS uri
WHERE name IS NOT NULL;

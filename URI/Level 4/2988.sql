--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2988

DROP TABLE matches, teams;
DROP DATABASE IF EXISTS URI_db;
CREATE DATABASE URI_db;
USE URI_db;

CREATE TABLE teams (
    id integer PRIMARY KEY,
    name varchar(50)
);

GRANT SELECT ON teams TO sql_user;

CREATE TABLE matches  (
    id integer PRIMARY KEY,
    team_1 integer,
    team_2 integer,
    team_1_goals integer,
    team_2_goals integer,
    FOREIGN KEY (team_1) REFERENCES teams(id),
    FOREIGN KEY (team_2) REFERENCES teams(id)
);

GRANT SELECT ON matches TO sql_user;insert into teams
    (id, name)
values
    (1,'CEARA'),
    (2,'FORTALEZA'),
    (3,'GUARANY DE SOBRAL'),
    (4,'FLORESTA');

insert into  matches
    (id, team_1, team_2, team_1_goals, team_2_goals)
values
    (1,4,1,0,4),
    (2,3,2,0,1);

-- solucao

SELECT 

-- name

    (
        SELECT 
            name 
        FROM teams t 
        WHERE t.id = team.id
    ) AS name,
    
-- matches

    (
        SELECT 
            count(name)
        FROM teams 
        INNER JOIN matches 
            ON teams.id = matches.team_1 or teams.id = matches.team_2
    ) AS matches



/*
    -- Finding victories
( -- Team 2 victories
    SELECT sum(case when team_2_goals > team_1_goals then 1 else 0 END) as victories 
    FROM teams t INNER JOIN matches m ON t.id = m.team_2 
    WHERE t.id = team.id
)+( -- Team 1 victories
    SELECT sum(case when team_1_goals > team_2_goals then 1 else 0 END) 
    FROM teams t INNER JOIN matches m ON t.id = m.team_1 
    WHERE t.id = team.id
) as victories,

-- Finding defeats 
( -- Team 2 Defeats
    SELECT sum(case when team_2_goals < team_1_goals then 1 else 0 END) as victories 
    FROM teams t INNER JOIN matches m ON t.id = m.team_2 
    WHERE t.id = team.id
)+( -- Team 1 Defeats
    SELECT sum(case when team_1_goals < team_2_goals then 1 else 0 END) 
    FROM teams t INNER JOIN matches m ON t.id = m.team_1 
    WHERE t.id = team.id
) as defeats,

( -- Team 2 Draws
    SELECT sum(case when team_2_goals = team_1_goals then 1 else 0 END) as victories 
    FROM teams t INNER JOIN matches m ON t.id = m.team_2 
    WHERE t.id = team.id
)+( -- Team 1 Draws
    SELECT sum(case when team_1_goals = team_2_goals then 1 else 0 END) 
    FROM teams t INNER JOIN matches m ON t.id = m.team_1 
    WHERE t.id = team.id
) as draws,

--Finding scores
( -- Team 2 scores
    SELECT sum(case when team_2_goals > team_1_goals then 3 when team_2_goals = team_1_goals then 1 else 0 END) as victories 
    FROM teams t INNER JOIN matches m ON t.id = m.team_2 
    WHERE t.id = team.id
)+( -- Team 1 scores
    SELECT sum(case when team_1_goals > team_2_goals then 3 when team_1_goals = team_2_goals then 1 else 0 END) 
    FROM teams t INNER JOIN matches m ON t.id = m.team_1 
    WHERE t.id = team.id
) as score
*/
FROM teams team;
-- ORDER BY score DESC;

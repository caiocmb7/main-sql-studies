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

SELECT * FROM matches;

SELECT 
    *
FROM matches
INNER JOIN teams
    ON matches.team_1 = teams.id OR matches.team_2 = teams.id;

/*    
CASE
        WHEN matches.team_1_goals == matches.team_2_goals THEN 'empate'
        WHEN matches.team_1_goals > matches.team_2_goals THEN 'vitoria'
        WHEN matches.team_1_goals < matches.team_2_goals THEN 'derrota' 
    END
    
    COUNT(DISTINCT matches.team_1) + COUNT(DISTINCT matches.team_2) AS matches
*/
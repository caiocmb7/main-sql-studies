/*In this project, you’re going to make your own table with some small set of “famous people”, then make more tables about things they do and join those to create nice human readable lists.

For example, here are types of famous people and the questions your data could answer:

Movie stars: What movies are they in? Are they married to each other?
Singers: What songs did they write? Where are they from?
Authors: What books did they write?
Fictional characters: How are they related to other characters? What books do they show up in? */

CREATE TABLE billionaires (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    age INTEGER,
    nationality TEXT);
    
INSERT INTO billionaires (fullname, age, nationality) VALUES ("Jeff Bezos", 54, "US");
INSERT INTO billionaires (fullname, age, nationality) VALUES ("Bill Gates", 62, "US");
INSERT INTO billionaires (fullname, age, nationality) VALUES ("Warren Buffet", 87, "US");
INSERT INTO billionaires (fullname, age, nationality) VALUES ("Bernard Arnault", 69, "France");
INSERT INTO billionaires (fullname, age, nationality) VALUES ("Mark Zucherberg", 33, "US");

CREATE TABLE wealth (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    billionare_id INTEGER,
    net_worth TEXT,
    source_wealth TEXT);
    
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (1, "112 billion", "Amazon");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (2, "90 billion", "Microsoft");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (3, "84 billion", "Berkshire Hathaway");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (4, "72 billion", "LVMH");
INSERT INTO wealth (billionare_id, net_worth, source_wealth) VALUES (5, "71 billion", "Facebook");

SELECT * FROM billionaires;
SELECT * FROM wealth;

SELECT billionaires.fullname, wealth.net_worth, wealth.source_wealth FROM billionaires
    JOIN wealth
    ON billionaires.id = wealth.id;
    
SELECT fullname, nationality FROM billionaires
    WHERE nationality == "US"
    GROUP BY fullname;   

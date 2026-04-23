CREATE TABLE players(
    player_id INT PRIMARY KEY,
    last_name VARCHAR(20)
);


CREATE TABLE positions(
   last_name VARCHAR(20),
   position VARCHAR(20)
);


CREATE TABLE pitcher_stats(
    player_id INT,
    season INT,
    games INT,
    innings_pitched DECIMAL(5,1),
    PRIMARY KEY (player_id, season)
);


INSERT INTO players(player_id, last_name) 
VALUES
(621053, 'Eckersley'),
(622663, 'Stewart'),
(605488, 'Mulder'),
(678022, 'Zito'),
(663687, 'Fingers'),
(669372, 'Hudson');

INSERT INTO positions(last_name, position)
VALUES
('Eckersley', 'RP'),
('Stewart', 'SP'),
('Mulder', 'SP'),
('Zito', 'SP'),
('Fingers', 'RP'),
('Hudson', 'SP');

INSERT INTO pitcher_stats(player_id, season, games, innings_pitched)
VALUES
(621053, 2024, 48, 51.1),
(622663, 2024, 31, 182.2),
(605488, 2024, 7, 33.0),
(663687, 2024, 21, 72.1),
(669372, 2024, 8, 33.2),
(621053, 2025, 56, 57.2),
(622663, 2025, 29, 162.2),
(605488, 2025, 32, 171.2),
(678022, 2025, 25, 127.2),
(669372, 2025, 23, 90.1);

SELECT 
    p.last_name,
    SUM(s.innings_pitched) AS total_ip
FROM players p
JOIN positions pos
    ON p.last_name = pos.last_name
JOIN pitcher_stats s
    ON p.player_id = s.player_id
WHERE pos.position = 'SP'
GROUP BY p.player_id, p.last_name
HAVING COUNT(DISTINCT s.season) > 1;


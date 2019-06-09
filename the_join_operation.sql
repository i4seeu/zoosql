SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';

SELECT DISTINCT id,stadium,team1,team2
FROM game
JOIN goal
ON game.id = goal.matchid
WHERE id = 1012;

SELECT  player, teamid, stadium, mdate
FROM game 
JOIN goal 
ON (id=matchid)
WHERE teamid = 'GER';

SELECT   team1, team2, player
FROM game 
JOIN goal 
ON (id=matchid)
WHERE player LIKE 'Mario%';

SELECT player, teamid,coach, gtime
FROM goal 
JOIN eteam
ON (teamid = id)
WHERE gtime <= 10;

SELECT mdate, teamname
FROM game
JOIN eteam
ON game.team1 = eteam.id
WHERE coach = 'Fernando Santos';

SELECT player
FROM goal
JOIN game
ON goal.matchid = game.id
WHERE stadium = 'National Stadium, Warsaw';

SELECT DISTINCT player
FROM game 
JOIN goal 
ON matchid = id 
WHERE (team2='GER' OR team1 = 'GER') AND teamid != 'GER';

SELECT teamname, COUNT(gtime) AS goals
FROM eteam 
JOIN goal 
ON id=teamid
GROUP BY teamname;

SELECT stadium, COUNT(gtime) AS goals
FROM game 
JOIN goal 
ON id=matchid
GROUP BY stadium;

SELECT matchid,mdate, COUNT(gtime) AS goals_POL
FROM goal
JOIN game 
ON goal.matchid = game.id
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid,mdate;

SELECT matchid, mdate, COUNT(gtime) AS goals_GER
FROM goal
JOIN game
ON goal.matchid = game.id
WHERE teamid = 'GER'
GROUP BY matchid,mdate;

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, 
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game 
LEFT JOIN goal 
ON matchid = id
GROUP by mdate, matchid, team1, team2;

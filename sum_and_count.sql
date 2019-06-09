SELECT SUM(population)
FROM world;

SELECT DISTINCT continent
From world;

SELECT SUM(gdp) AS GDP_Africa
FROM world
WHERE continent = 'Africa';

SELECT COUNT(name)
FROM world
WHERE area > 1000000;

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

SELECT continent, COUNT(name) AS countries
FROM world
GROUP BY continent;

SELECT continent, COUNT(name) AS countries
FROM world
WHERE population > 10000000
GROUP BY continent;

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;
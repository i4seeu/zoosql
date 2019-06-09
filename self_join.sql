SELECT COUNT(id)
FROM stops;

SELECT id
FROM stops
WHERE name = 'Craiglockhart';

SELECT id, name
FROM stops
JOIN route
ON stops.id = route.stop
WHERE company = 'LRT' AND num = 4;

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

SELECT a.company, a.num, a.stop, b.stop
FROM route a 
JOIN route b 
ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket'  AND stopb.name = 'Leith';

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'  AND stopb.name ='Tollcross';

SELECT stopa.name, a.company, a.num
FROM route a
JOIN route b ON
       (a.company = b.company AND a.num = b.num)
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE b.company = 'LRT' AND stopb.name = 'Craiglockhart';

SELECT rx.num, rx.company, sx.name AS change_at, ry.num, ry.company
FROM route rx 
JOIN route ry 
ON (rx.stop = ry.stop)
JOIN stops sx 
ON (sx.id = rx.stop)
WHERE rx.num != ry.num
   AND rx.company IN (SELECT DISTINCT ra.company FROM route ra
                       JOIN stops sa ON (ra.stop = (SELECT id FROM stops sa WHERE name = 'Craiglockhart'))
                      WHERE ra.num = rx.num)
   AND ry.company IN (SELECT DISTINCT rb.company FROM route rb
                       JOIN stops sb ON (rb.stop = (SELECT id FROM stops sb WHERE name = 'Lochend'))
                      WHERE rb.num = ry.num);

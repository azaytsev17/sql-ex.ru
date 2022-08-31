/*Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).*/

SELECT name 
FROM ships
WHERE class = name
UNION
SELECT ship as name
FROM outcomes o, classes c
WHERE o.ship = c.class

/*Найдите названия кораблей, имеющих наибольшее число орудий среди всех 
имеющихся кораблей такого же водоизмещения (учесть корабли из таблицы Outcomes).*/

WITH b_g AS 
(
	SELECT MAX(numGuns) AS maxnumGuns
	, displacement
	FROM classes
	GROUP by displacement
)

SELECT name
FROM (
	SELECT o.ship AS name
	, c.numGuns
	, c.displacement
	FROM outcomes o
	JOIN classes c ON c.class = o.ship
	WHERE o.ship NOT IN (SELECT name FROM ships)
	
	UNION
	
	SELECT s.name
	, c.numGuns
	, c.displacement
	FROM ships s
	JOIN classes c ON c.class = s.class
) AS t1
JOIN b_g 
ON b_g.maxnumGuns = t1.numGuns 
AND b_g.displacement = t1.displacement
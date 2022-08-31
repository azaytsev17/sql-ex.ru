/*Для каждого класса определите число кораблей этого класса, потопленных в сражениях. 
Вывести: класс и число потопленных кораблей.*/

SELECT c.class
, COUNT(t1.ship) as num
FROM classes c
LEFT JOIN (
	SELECT o.ship
	, s.class
	FROM outcomes o
	LEFT JOIN ships s ON s.name = o.ship
	WHERE o.result = 'sunk'
	) AS t1
ON t1.class = c.class OR t1.ship = c.class
GROUP BY c.class

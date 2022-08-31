/*Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), 
вывести название, водоизмещение и число орудий.*/

SELECT o.ship AS name
, displacement
, numGuns
FROM (
	SELECT name AS ship
	, displacement
	, numGuns
	FROM ships s
	INNER JOIN classes c ON c.class = s.class
	UNION
	SELECT class AS ship
	, displacement
	, numGuns
	FROM classes
) as t1
RIGHT JOIN outcomes o ON o.ship = t1.ship
WHERE o.battle = 'Guadalcanal'

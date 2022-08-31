/*С точностью до 2-х десятичных знаков определите среднее число орудий 
всех линейных кораблей (учесть корабли из таблицы Outcomes).*/

SELECT CAST(AVG(numGuns*1.0) AS numeric(6,2))
FROM (
	SELECT s.name
	, c.class
	, c.numGuns
	FROM ships s
	INNER JOIN classes c ON c.class = s.class AND c.type = 'bb'
	
	UNION
	
	SELECT o.ship AS name
	, c.class
	, c.numGuns
	FROM outcomes o
	INNER JOIN classes c on c.class = o.ship AND c.type = 'bb'
) AS t1

/*Определить страны, которые потеряли в сражениях все свои корабли.*/

WITH total_ships AS (
	SELECT COUNT(name) as to_co 
	,country
	FROM (
		SELECT name
		, country
		FROM classes AS c 
		INNER JOIN ships AS s ON s.class = c.class
		UNION
		SELECT ship
		, country
		FROM classes c1 
		INNER JOIN outcomes o ON o.ship = c1.class
	) AS t1 
	GROUP BY country
),
total_sunk AS (
	SELECT COUNT(name) as to_co
	, country
	FROM(
		SELECT name
		, country
		FROM classes AS c2 
		INNER JOIN ships AS s1 ON s1.class = c2.class
		WHERE name IN (
			SELECT ship FROM outcomes WHERE result = 'sunk'
			)
		UNION
		SELECT ship
		, country
		FROM classes AS c3 
		INNER JOIN outcomes AS o1 ON o1.ship  = c3.class
		WHERE o1.result = 'sunk'
	) AS t2
	GROUP BY country
)

SELECT tsk.country
FROM total_ships AS tss
INNER JOIN total_sunk AS tsk ON tsk.country = tss.country
WHERE tss.to_co = tsk.to_co
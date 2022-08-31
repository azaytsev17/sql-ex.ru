/*Одной из характеристик корабля является половина куба калибра его главных орудий (mw). 
С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, 
у которой есть корабли в базе данных.*/

WITH mwt AS (
	SELECT bore*bore*bore/2 AS mw
	, country
	, class
	FROM classes
	WHERE bore IS NOT NULL
)
,s AS (
	SELECT class 
	FROM ships
		UNION ALL
	SELECT DISTINCT ship AS class
	FROM outcomes AS o 
	LEFT JOIN ships AS sh 
	ON o.ship = sh.name 
	WHERE sh.name IS NULL
)
SELECT country
,CAST(AVG(mw) AS NUMERIC(6, 2)) AS avg_mwt
FROM mwt
INNER JOIN s
ON mwt.class = s.class
GROUP BY country
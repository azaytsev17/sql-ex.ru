/*Для каждого класса определите год, когда был спущен на воду первый корабль этого класса. 
Если год спуска на воду головного корабля неизвестен, определите минимальный год спуска на воду кораблей этого класса. 
Вывести: класс, год.*/

WITH t1 AS (
	SELECT s.name
	, s.class
	, s.launched
	FROM Ships AS s
	
	UNION
	
	SELECT o.ship
	, o.ship AS class
	, NULL AS year
	FROM Outcomes AS o
	WHERE NOT EXISTS (
		SELECT *
		FROM Ships S
		WHERE S.class = O.ship
		)
)

SELECT c.class, MIN(t1.launched) 
FROM Classes AS c
LEFT JOIN t1
ON c.class = t1.class
GROUP BY c.class

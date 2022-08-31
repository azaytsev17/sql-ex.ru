/* Найдите корабли, `сохранившиеся для будущих сражений`; 
т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.*/

WITH damaged AS (
	SELECT o.ship
	, b.date
	FROM outcomes o
	INNER JOIN battles b ON o.battle = b.name
	WHERE result = 'damaged'
)

SELECT DISTINCT d.ship
FROM (
	SELECT o.ship
	, b.date
	FROM outcomes o
	INNER JOIN	battles AS b ON o.battle = b.name
) as ship_date
RIGHT JOIN damaged AS d
ON ship_date.ship = d.ship
WHERE ship_date.date > d.date

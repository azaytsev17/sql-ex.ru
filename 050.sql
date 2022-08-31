/*Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.*/

SELECT battle
FROM outcomes
WHERE ship IN (
	SELECT name FROM ships WHERE class = 'Kongo'
)
GROUP BY battle

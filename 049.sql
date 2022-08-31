/*Найдите названия кораблей с орудиями калибра 16 дюймов (учесть корабли из таблицы Outcomes).*/

SELECT s.name
FROM classes c
INNER JOIN ships s ON s.class = c.class
WHERE c.bore = '16'

UNION

SELECT o.ship
FROM classes c1
INNER JOIN outcomes o ON o.ship = c1.class
WHERE c1.bore = '16'


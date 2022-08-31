/*Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship.*/

SELECT o.ship
FROM outcomes AS o
INNER JOIN battles AS b ON o.battle = b.name
WHERE o.result = 'sunk' AND b.name = 'North Atlantic'
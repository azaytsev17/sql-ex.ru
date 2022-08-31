/*Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed*/

SELECT DISTINCT p.type
, p.model
, l.speed
FROM product AS p
JOIN laptop AS l ON l.model = p.model
WHERE l.speed < (SELECT MIN(speed) FROM pc)

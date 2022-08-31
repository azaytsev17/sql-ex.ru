/*Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.*/

SELECT AVG(laptop.speed) AS avg_speed
FROM laptop
WHERE laptop.price > 1000

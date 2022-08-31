/*Найдите среднюю скорость ПК, выпущенных производителем A.*/

SELECT AVG(pc.speed) AS avg_speed
FROM pc 
INNER JOIN product AS p ON pc.model = p.model
WHERE p.maker = 'A'

/*Для каждого производителя, имеющего модели в таблице Laptop, 
найдите средний размер экрана выпускаемых им ПК-блокнотов.*/

SELECT p.maker
, AVG(laptop.screen) AS avg_screen
FROM product AS p 
JOIN laptop AS l ON p.model = l.model
GROUP BY p.maker

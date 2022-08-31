/*Используя таблицу Product, определить количество производителей, выпускающих по одной модели.*/

SELECT COUNT(maker) AS qty
FROM product
WHERE maker IN (
	SELECT maker 
	FROM product
	GROUP BY maker
	HAVING count(model) = 1
)

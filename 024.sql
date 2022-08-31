/*Перечислите номера моделей любых типов, 
имеющих самую высокую цену по всей имеющейся в базе данных продукции.*/

SELECT model
FROM (
	SELECT model, price
	FROM pc
		UNION
	SELECT model, price
	FROM laptop
		UNION
	SELECT model, price
	FROM printer
) AS t1
WHERE price = (
	SELECT MAX(price)
	FROM (
		SELECT price
		FROM pc
			UNION
		SELECT price
		FROM laptop
			UNION
		SELECT price
		FROM printer
		) as t2
)

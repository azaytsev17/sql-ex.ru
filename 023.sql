/*Найдите производителей, которые производили бы как ПК со скоростью не менее 750 МГц, 
так и ПК-блокноты со скоростью не менее 750 МГц. Вывести: Maker */

SELECT DISTINCT maker 
FROM product
WHERE model IN (
	SELECT model 
	FROM pc 
	WHERE pc.speed >= 750
	)
	
INTERSECT

SELECT DISTINCT maker 
FROM product
WHERE model IN (
SELECT model 
 FROM laptop 
 WHERE laptop.speed >= 750
)

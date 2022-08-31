/*Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). 
Вывести: одна общая средняя цена.*/

SELECT sum(t.price)/sum(t.num) as med
FROM(
	SELECT price
	,1 as num 
	FROM pc,product
	WHERE pc.model=product.model AND product.maker='A'
		UNION all
	SELECT price
	,1 as num 
	FROM laptop,product
	WHERE laptop.model=product.model AND product.maker='A') as t
/*Найдите средний размер диска ПК каждого из тех производителей, 
которые выпускают и принтеры. Вывести: maker, средний размер HD.*/

SELECT DISTINCT maker
, AVG(pc.hd) AS avg_hdd
FROM product, pc 
WHERE product.model = pc.model AND 
product.maker IN (
	SELECT DISTINCT maker 
	FROM product
	WHERE type = 'Printer'
)
GROUP BY product.maker

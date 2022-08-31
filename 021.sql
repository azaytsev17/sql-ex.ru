/*Найдите максимальную цену ПК, выпускаемых каждым производителем, 
у которого есть модели в таблице PC. Вывести: maker, максимальная цена.*/

SELECT p.maker
, MAX(pc.price)
FROM product AS p 
INNER JOIN pc ON p.model = pc.model
GROUP BY p.maker

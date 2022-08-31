/*Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price*/

SELECT DISTINCT p.maker
, pri.price
FROM product AS p 
INNER JOIN printer AS pri ON pri.model = p.model
WHERE pri.color = 'y' 
AND (pri.price <= (SELECT MIN(price) FROM printer WHERE printer.color = 'y'))
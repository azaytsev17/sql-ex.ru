/*Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker*/

SELECT DISTINCT maker 
FROM product AS p
INNER JOIN pc ON product.model = p.model
WHERE pc.speed >= 450

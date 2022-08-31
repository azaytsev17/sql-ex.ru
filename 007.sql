/*Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) 
производителя B (латинская буква).*/

SELECT p.model
, pc.price
FROM product AS p
INNER JOIN pc on p.model = pc.model
WHERE maker = 'b'

UNION

SELECT p.model
, l.price
FROM product AS p
INNER JOIN laptop AS l ON p.model = l.model
WHERE maker = 'b'

UNION

SELECT p.model
, pr.price
FROM product AS p
INNER JOIN printer AS pr on p.model = pr.model
WHERE maker = 'b'

/*Найдите производителей, выпускающих по меньшей мере 
три различных модели ПК. Вывести: Maker, число моделей ПК.*/

SELECT maker
, COUNT(model) AS count_model
FROM product
WHERE type = 'PC'
GROUP BY maker
HAVING COUNT(model) > 2

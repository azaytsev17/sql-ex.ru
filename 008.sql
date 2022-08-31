/*Найдите производителя, выпускающего ПК, но не ПК-блокноты.*/

SELECT DISTINCT maker
FROM product
WHERE product.type = 'PC'
AND product.maker NOT IN (SELECT product.maker FROM product WHERE type = 'laptop')
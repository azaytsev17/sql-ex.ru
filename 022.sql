/*Для каждого значения скорости ПК, превышающего 600 МГц, 
определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.*/

SELECT DISTINCT speed
, AVG(price) AS avg_price
FROM pc
WHERE pc.speed > 600
GROUP BY pc.speed
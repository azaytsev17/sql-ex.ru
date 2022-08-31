/*Найдите номер модели, скорость и размер жесткого диска ПК, 
имеющих 12x или 24x CD и цену менее 600 дол.*/

SELECT DISTINCT model
, speed
, hd
FROM pc
WHERE price<600 AND (cd='12x' OR cd='24x')

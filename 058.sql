/*Для каждого типа продукции и каждого производителя из таблицы Product c точностью до двух десятичных знаков 
найти процентное отношение числа моделей данного типа данного производителя к общему числу моделей этого производителя.
Вывод: maker, type, процентное отношение числа моделей данного типа к общему числу моделей производителя*/

SELECT t3.maker
, t3.type
, CAST(100.00 * t3.num/t3.t_num AS numeric(6,2))
FROM ( 
SELECT t1.maker
, t1.type
, num
, t_num 
FROM (
	SELECT maker
	, type
	, count(*) num 
	FROM product 
	GROUP by maker, type
	) t1
	JOIN (
		SELECT maker
		, count(*) t_num 
		FROM product
		GROUP BY maker
		) t2 
	ON t2.maker = t1.maker
	)t3
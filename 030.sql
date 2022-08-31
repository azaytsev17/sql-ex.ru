/* В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз 
(первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту 
за каждую дату выполнения операций будет соответствовать одна строка. Вывод: point, date, суммарный расход пункта за день (out), 
суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).*/

SELECT point
, date
, SUM(sum_out)
, SUM(sum_inc)
FROM (
	SELECT point
	, date
	, NULL AS sum_out
	, SUM(inc) AS sum_inc 
	FROM income
	GROUP BY point, date
	
	UNION
	
	SELECT point
	, date
	, SUM(out) AS sum_out
	, NULL as sum_inc
	FROM outcome
	GROUP BY point, date) AS t1
GROUP BY point, date
ORDER BY point

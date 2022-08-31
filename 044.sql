/*Найдите названия всех кораблей в базе данных, начинающихся с буквы R.*/

WITH n_list AS (
	SELECT name FROM ships 
	UNION
	SELECT ship FROM outcomes)
SELECT name
FROM n_list
WHERE name LIKE 'R%'

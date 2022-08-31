/*Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).
Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.*/

WITH n_list AS (
	SELECT name FROM ships
	UNION
	SELECT ship FROM outcomes)
SELECT name
FROM n_list
WHERE name LIKE '% % %'
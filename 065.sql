/*Пронумеровать уникальные пары {maker, type} из Product, упорядочив их следующим образом:
- имя производителя (maker) по возрастанию;
- тип продукта (type) в порядке PC, Laptop, Printer.
Если некий производитель выпускает несколько типов продукции, то выводить его имя только в первой строке;
остальные строки для ЭТОГО производителя должны содержать пустую строку символов ('').*/

SELECT 
ROW_NUMBER() OVER (ORDER BY maker) AS num
, CASE WHEN numb = 1 THEN maker
	ELSE '' END maker,
type
FROM (
	SELECT maker
	, type
	, ROW_NUMBER() OVER (PARTITION BY maker ORDER BY maker, pos) numb
	FROM (
		SELECT DISTINCT maker
		, type
		, CASE WHEN type = 'PC' THEN 0
			WHEN type = 'Laptop' THEN 1
			ELSE 2 END pos
		FROM product
	)t1
)t2
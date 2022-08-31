/* Для каждого производителя, у которого присутствуют модели хотя бы в одной из таблиц PC, Laptop или Printer,
определить максимальную цену на его продукцию.
Вывод: имя производителя, если среди цен на продукцию данного производителя присутствует NULL, то выводить для этого производителя NULL,
иначе максимальную цену. */

WITH mop AS (
	SELECT model
	, CASE WHEN price IS NULL THEN 1 
		ELSE 0 END AS counter
	, price
	, type 
	FROM (
		SELECT model
		, price
		, 'PC' AS type
		FROM pc
		
		UNION
		
		SELECT model
		, price
		, 'Laptop' AS type
		FROM laptop
		
		UNION
		
		SELECT model
		, price
		, 'Printer' AS type
		FROM printer
	) AS a
),
 
tts AS (
	SELECT maker
	, SUM(counter) AS null_ch
	, MAX(price) as max_price
	FROM product AS p
	INNER JOIN mop
	ON p.model = mop.model AND p.type = mop.type
	GROUP BY maker
)

SELECT DISTINCT maker, CASE WHEN null_ch > 0 THEN NULL ELSE max_price END price
FROM tts


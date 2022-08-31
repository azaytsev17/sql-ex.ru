/* Посчитать остаток денежных средств на всех пунктах приема на начало 
дня 15/04/01 для базы данных с отчетностью не чаще одного раза в день.*/

SELECT SUM(sums) AS Remain
FROM(
	SELECT point
	, SUM(inc) AS sums
	FROM income_o
	WHERE date < '2001-04-15'
	GROUP BY point
	
	UNION
	
	SELECT point, -SUM(out) AS sums
	FROM outcome_o
	WHERE date < '2001-04-15'
	GROUP BY point
) AS t1

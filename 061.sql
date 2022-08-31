/*Посчитать остаток денежных средств на всех пунктах приема 
для базы данных с отчетностью не чаще одного раза в день.*/

SELECT SUM(sums) AS Remain
FROM(
	SELECT point
	, SUM(inc) AS sums
	FROM income_o
	GROUP BY point
	
	UNION
	
	SELECT point, -1*SUM(out) AS sums
	FROM outcome_o
	GROUP BY point
) AS t1

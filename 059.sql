/*Посчитать остаток денежных средств на каждом пункте приема 
для базы данных с отчетностью не чаще одного раза в день. Вывод: пункт, остаток.*/

SELECT point
, SUM(t1.remain) as rem
FROM(
	SELECT point, SUM(inc) as remain
	FROM income_o
	GROUP BY point
	UNION
	SELECT point, -1*SUM(out) as remain
	FROM outcome_o
	GROUP BY point
) AS t1
GROUP by point

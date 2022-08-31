/*Посчитать остаток денежных средств на начало дня 15/04/01 на каждом пункте приема 
для базы данных с отчетностью не чаще одного раза в день. Вывод: пункт, остаток.
Замечание. Не учитывать пункты, информации о которых нет до указанной даты.*/

SELECT point
, SUM(sums)
FROM (
	SELECT point
	, SUM(inc) as sums
	FROM income_o
	WHERE date < '2001-04-15'
	GROUP BY point
	
	UNION
	
	SELECT point, -1*SUM(out) as sums
	FROM outcome_o
	WHERE date < '2001-04-15'
	GROUP BY point
) AS t1
GROUP BY point

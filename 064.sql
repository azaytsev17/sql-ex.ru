WITH inc AS (
	SELECT point, date, SUM(inc) as i_sum
	FROM Income
	GROUP BY point, date
), 
outc AS (
	SELECT point, date, SUM(out) as o_sum
	FROM Outcome
	GROUP BY point, date
),
t1 AS (
	SELECT COALESCE(i.point, o.point) AS point
	, COALESCE(i.date, o.date) AS date
	, COALESCE(i_sum, o_sum) AS money_sum
	, CASE WHEN (i_sum IS NULL AND o_sum IS NOT NULL) THEN 'out'
		WHEN (i_sum IS NOT NULL AND o_sum IS NULL) THEN 'inc'
		END operation
	FROM inc i
	FULL JOIN outc o
	ON i.point = o.point AND i.date = o.date
)

SELECT point, date, operation, money_sum 
FROM t1
WHERE operation IS NOT NULL
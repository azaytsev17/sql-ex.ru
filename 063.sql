/*Определить имена разных пассажиров, когда-либо летевших на одном и том же месте более одного раза.*/

SELECT name
FROM passenger
WHERE ID_psg IN (
	SELECT ID_psg
	FROM pass_in_trip
	GROUP by place, ID_psg
	HAVING COUNT(*) > 1
)
/*Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении.*/

SELECT c.class
FROM classes c
LEFT JOIN ships s ON s.class = c.class
WHERE c.class IN (
	SELECT ship FROM outcomes o WHERE o.result = 'sunk'
	) 
OR s.name IN (
	SELECT ship FROM outcomes o1 WHERE o1.result = 'sunk'
	)
GROUP BY c.class

/*Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн*/

SELECT DISTINCT name
FROM ships s
INNER JOIN classes c ON c.class = s.class
WHERE UPPER(c.country) = 'JAPAN' 
AND c.type = 'bb' 
AND (c.numGuns >= 9 OR c.numGuns is NULL) 
AND (c.bore < 19 OR c.bore IS NULL) 
AND (c.displacement <= 65000 OR c.displacement IS NULL)

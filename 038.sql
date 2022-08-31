/*Найдите страны, имевшие когда-либо классы обычных боевых кораблей ('bb') и имевшие когда-либо классы крейсеров ('bc').*/

SELECT DISTINCT country
FROM classes
WHERE type = 'bb'

INTERSECT

SELECT DISTINCT country
FROM classes
WHERE type = 'bc'

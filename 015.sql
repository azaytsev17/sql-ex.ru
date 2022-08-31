/*Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD*/

SELECT DISTINCT hd
FROM pc
GROUP BY hd
HAVING COUNT(pc.hd) >= 2
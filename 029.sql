/*В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день 
[т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). 
Использовать таблицы Income_o и Outcome_o.*/

SELECT t1.point
, t1.date
, inc
, out
FROM Income_o AS t1 
LEFT JOIN Outcome_o AS t2 ON t1.point = t2.point AND t1.date = t2.date

UNION

SELECT t2.point
, t2.date
, inc
, out
FROM Income_o AS t1 
RIGHT JOIN Outcome_o AS t2 ON t1.point = t2.point AND t1.date = t2.date

/*Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.*/

SELECT Classes.class
, Ships.name
, Classes.country 
FROM Classes 
JOIN Ships ON Classes.class = Ships.class 
WHERE Classes.numGuns >= 10

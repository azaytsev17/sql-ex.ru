/*Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.*/

SELECT b.name
FROM battles b
LEFT JOIN ships s
ON DATEPART(yyyy, b.date) = s.launched
WHERE s.launched IS NULL

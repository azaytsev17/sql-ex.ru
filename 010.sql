/*Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price*/

SELECT DISTINCT printer.model
, printer.price 
FROM printer
WHERE printer.price = (SELECT MAX(printer.price) FROM printer)

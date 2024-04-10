SELECT pizza_name FROM menu
UNION
SELECT pizza_name FROM menu
ORDER BY pizza_name DESC;


-- Напишите оператор SQL, который возвращает уникальные названия пиццы 
-- из таблицы  и упорядочивает их по столбцу Pizza_name в порядке убывания. 
-- Denied: DISTINCT, GROUP BY, HAVING, любой тип JOIN
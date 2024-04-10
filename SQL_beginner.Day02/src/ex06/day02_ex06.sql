SELECT p2.pizza_name, p3.name as pizzeria_name FROM person_order
JOIN 
	(SELECT id, name FROM person
	WHERE name IN ('Denis', 'Anna')) as p1
ON p1.id = person_id
JOIN
	(SELECT id, pizzeria_id, pizza_name FROM menu) as p2
ON p2.id = menu_id
JOIN
	(SELECT id, name FROM pizzeria) as p3
ON p2.pizzeria_id = p3.id
ORDER BY p2.pizza_name, pizzeria_name;


-- найдите все названия пицц (и соответствующие названия пиццерий с помощью 
-- таблицы menu), которые заказали Денис или Анна. 
-- Отсортируйте результат по обоим столбцам. 
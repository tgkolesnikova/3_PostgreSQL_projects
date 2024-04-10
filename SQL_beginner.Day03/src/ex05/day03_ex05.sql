SELECT pizzeria.name as pizzeria_name FROM person_visits
JOIN pizzeria ON pizzeria_id = pizzeria.id
WHERE person_id = (
	SELECT id FROM person 
	WHERE name = 'Andrey'
)
EXCEPT
SELECT pizzeria.name as pizzeria_name FROM person_order
JOIN menu ON menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
WHERE person_id = (
	SELECT id FROM person 
	WHERE name = 'Andrey'
)
ORDER BY pizzeria_name;


-- Оператор SQL, возвращающий список пиццерий, которые Андрей посетил, но не сделал заказ. 
-- Отсортируйте по названию пиццерии.
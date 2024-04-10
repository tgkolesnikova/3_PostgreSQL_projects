SELECT person.name AS person_name, 
	   menu.pizza_name AS pizza_name, 
	   pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY person_name, pizza_name, pizzeria_name;


-- оператор SQL, который возвращает список имен людей, сделавших заказ на пиццу 
-- в соответствующей пиццерии. Пример результата (с именованными столбцами) представлен ниже, 
-- и да... пожалуйста, сделайте заказ по 3 столбцам (person_name, pizza_name, pizzeria_name) 
-- в порядке возрастания.
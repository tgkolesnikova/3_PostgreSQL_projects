SELECT person.address, 
	pizzeria.name, 
	COUNT(menu_id) AS count_of_orders 
FROM person_order
JOIN person ON person_id = person.id
JOIN menu ON menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY person.address, pizzeria.name
ORDER BY 1, 2;


-- оператор SQL, который возвращает адрес, название пиццерии и сумму заказов человека. 
-- Результат следует отсортировать по адресу, а затем по названию ресторана. 
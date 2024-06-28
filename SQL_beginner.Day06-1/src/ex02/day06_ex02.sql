SELECT person.name, 
	pizza_name, 
	menu.price, 
	ROUND(menu.price * (1 - discount / 100)) AS discount_price,
	pizzeria.name AS pizzeria_name 
FROM person_order
JOIN person ON person_id = person.id
JOIN menu ON menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
JOIN person_discounts ON (person_order.person_id = person_discounts.person_id 
						  AND pizzeria.id = person_discounts.pizzeria_id)
ORDER BY 1, 2;

-- оператор SQL, который возвращает заказы с фактической ценой и ценой со скидкой, 
-- применяемой для каждого человека в соответствующей пиццерии, 
-- отсортированные по имени человека и названию пиццы.
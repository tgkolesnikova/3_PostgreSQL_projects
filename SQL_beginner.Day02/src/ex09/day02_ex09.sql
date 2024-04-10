SELECT name FROM person
JOIN
	(SELECT person_id, menu_id, pizza_name FROM person_order
	JOIN menu
	ON person_order.menu_id = menu.id
	WHERE menu.pizza_name = 'cheese pizza') as ordered_cheese
ON person.id = ordered_cheese.person_id
JOIN
	(SELECT person_id, menu_id, pizza_name FROM person_order
	JOIN menu
	ON person_order.menu_id = menu.id
	WHERE menu.pizza_name = 'pepperoni pizza') as ordered_pepperoni
ON person.id = ordered_pepperoni.person_id
WHERE gender = 'female'
ORDER BY person.name;


-- имена всех женщин, которые заказывали пепперони и сырную пиццу
-- (в любое время и в любых пиццериях),
-- результат упорядочить по имени человека. 
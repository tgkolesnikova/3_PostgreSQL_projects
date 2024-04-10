SELECT p.pizza_name as pizza_name, 
	name as pizzeria_name, 
	p.price FROM pizzeria
JOIN 
	(SELECT pizza_name, pizzeria_id, price FROM menu
	WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza') as p
ON p.pizzeria_id = pizzeria.id
ORDER BY pizza_name, pizzeria_name;



-- Найдите полную информацию обо всех возможных названиях и ценах пиццерий, 
-- чтобы получить пиццу с грибами или пепперони. 
-- отсортируйте результат по названию пиццы и названию пиццерии. 
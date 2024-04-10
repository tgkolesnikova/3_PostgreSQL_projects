WITH p1 AS (
	SELECT pizza_name, price, menu.id, 
	name as pizzeria_name1 FROM menu
	JOIN pizzeria ON pizzeria_id = pizzeria.id),
	
	p2 AS (
	SELECT pizza_name, price, menu.id, 
	name as pizzeria_name2 FROM menu
	JOIN pizzeria ON pizzeria_id = pizzeria.id)	
	
SELECT p1.pizza_name,  
		pizzeria_name1, 
		pizzeria_name2, p1.price FROM p1
JOIN p2 ON p1.pizza_name = p2.pizza_name 
			AND p1.price = p2.price 
			AND p1.pizzeria_name1 < p2.pizzeria_name2
			
ORDER BY p1.pizza_name;


-- Найдите одинаковые названия пицц по одинаковой цене, но из разных пиццерий. 
-- Убедитесь, что результат упорядочен по названию пиццы.
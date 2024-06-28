SELECT pizzeria.name, 
	COUNT(*) AS count_of_orders, 
	ROUND(AVG(price), 2) AS average_price, 
	MAX(price) AS max_price, 
	MIN(price) AS min_price 
FROM person_order
JOIN menu ON menu_id = menu.id
JOIN pizzeria ON pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 1;


-- оператор SQL, который возвращает количество заказов, среднюю цену, максимальную и минимальную
-- цену пиццы, продаваемой каждой пиццерией. Округлите среднюю цену до двух плавающих чисел.
-- Результат отсортировать по названию пиццерии. 
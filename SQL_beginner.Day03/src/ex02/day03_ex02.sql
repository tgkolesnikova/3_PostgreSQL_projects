SELECT pizza_name, price, 
	pizzeria.name as pizzeria_name 
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE menu.id NOT IN (
	SELECT menu_id FROM person_order
)
ORDER BY pizza_name, price;


-- Используйте оператор SQL из упражнения № 01 и выведите названия пицц из пиццерии, 
-- которые никто не заказывал, включая соответствующие цены. 
-- Результат должен быть отсортирован по названию и цене пиццы.
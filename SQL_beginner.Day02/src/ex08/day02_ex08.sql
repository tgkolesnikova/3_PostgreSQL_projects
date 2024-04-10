SELECT p1.name as name FROM menu
JOIN person_order
ON menu.id = person_order.menu_id
JOIN 
	(SELECT id, name, address FROM person
	WHERE address IN ('Moscow', 'Samara')) as p1
ON person_order.person_id = p1.id
WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC;



-- найдите имена всех мужчин из Москвы или Самары, которые заказывают 
-- пепперони или пиццу с грибами (или и то, и другое)
-- упорядочите результат по имени человека в порядке убывания
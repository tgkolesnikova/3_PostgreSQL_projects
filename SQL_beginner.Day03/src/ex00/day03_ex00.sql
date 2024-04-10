SELECT pizza_name, price, 
	pizzeria.name as pizzeria_name,
	visit_date
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE 
	price BETWEEN 800 AND 1000 AND 
	person_visits.person_id = (
		SELECT id FROM person
		WHERE name = 'Kate'
	)
ORDER BY pizza_name, price, pizzeria_name;


-- запрос возвращает список названий пицц, цен на пиццу, названий пиццерий и дат посещения 
-- Кейт и для цен от 800 до 1000 рублей. 
-- отсортировать по пицце, цене и названию пиццерии. 
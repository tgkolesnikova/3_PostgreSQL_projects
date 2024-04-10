SELECT person.name,
	   person_visits.visit_date,
	   pizzeria.name as pizzeria_name,
	   menu.pizza_name, menu.price
FROM person_visits
JOIN 
	(SELECT id, name FROM person) as person
ON person_visits.person_id = person.id
JOIN
	(SELECT id, name FROM pizzeria) as pizzeria
ON person_visits.pizzeria_id = pizzeria.id
JOIN 
	(SELECT * FROM menu
	 WHERE price < 800) as menu
ON pizzeria.id = menu.pizzeria_id
WHERE person_visits.visit_date = '2022-01-08'


-- название пиццерии, которую Дмитрий посетил 8 января 2022 года 
-- и где мог съесть пиццу менее чем за 800 рублей.
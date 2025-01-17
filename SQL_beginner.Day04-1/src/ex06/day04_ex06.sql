CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
(
    SELECT pizzeria.name as pizzeria_name FROM person_visits
	JOIN person ON person_visits.person_id = person.id
	JOIN pizzeria as pizzeria ON person_visits.pizzeria_id = pizzeria.id
	JOIN menu ON pizzeria.id = menu.pizzeria_id
	WHERE person_visits.visit_date = '2022-01-08' AND
		menu.price < 800 AND person.name = 'Dmitriy'
);



-- создайте материализованное представление mv_dmitriy_visits_and_eats (с включенными данными) 
-- на основе оператора SQL, который находит название пиццерии, которую Дмитрий посетил 
-- 8 января 2022 года и мог есть пиццу менее чем за 800 рублей

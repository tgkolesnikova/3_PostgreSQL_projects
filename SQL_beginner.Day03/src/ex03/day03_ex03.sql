WITH 
female_visits AS (
	SELECT COUNT(person_id) as female_count, pizzeria_id FROM person_visits
	WHERE person_id IN (
		SELECT id FROM person
		WHERE gender = 'female'
	)
	GROUP BY pizzeria_id
), 
male_visits AS (
	SELECT COUNT(person_id) as male_count, pizzeria_id FROM person_visits
	WHERE person_id IN (
		SELECT id FROM person
		WHERE gender = 'male'
	)
	GROUP BY pizzeria_id
)

SELECT name as pizzeria_name FROM pizzeria
JOIN female_visits ON pizzeria.id = female_visits.pizzeria_id
JOIN male_visits ON pizzeria.id = male_visits.pizzeria_id
WHERE female_count <> male_count
ORDER BY name;


-- Найдите пиццерии, которые чаще посещают женщины или мужчины. 
-- Сохраняйте дубликаты для любых операторов SQL с наборами 
-- (конструкции UNION ALL, EXCEPT ALL, INTERSECT ALL). 
-- Отсортируйте результат по названию пиццерии. 
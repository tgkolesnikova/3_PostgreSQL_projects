SELECT COALESCE(person.name, '-') as person_name, 
	p1.visit_date, 
	COALESCE(p2.name, '-') as pizzeria_name
FROM person
LEFT OUTER JOIN
	(SELECT person_id, pizzeria_id, visit_date FROM person_visits
	 WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') as p1
ON person.id = p1.person_id
FULL JOIN 
	(SELECT id, name FROM pizzeria) as p2
ON p1.pizzeria_id = p2.id
ORDER BY person_name, visit_date, pizzeria_name;


-- полный список имен людей, посетивших (или не посетивших) пиццерии в период 
-- с 1 по 3 января 2022 года с одной стороны и весь список названий пиццерий, 
-- которые были посещены (или не посещены) с другой сторона. 
-- также добавьте порядок для всех трех столбцов.
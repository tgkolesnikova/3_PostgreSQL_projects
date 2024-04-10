SELECT name, rating FROM pizzeria
LEFT JOIN 
(SELECT * FROM person_visits) as p 
ON  pizzeria.id = p.pizzeria_id
WHERE p.pizzeria_id is null;


-- Напишите оператор SQL, который возвращает список названий пиццерий с соответствующим 
-- значением рейтинга, которые никто не посещал. 
-- Denied: NOT IN, IN, NOT EXISTS, EXISTS, UNION, EXCEPT, INTERSECT
SELECT person.name, 
	COUNT(person_visits.id) AS count_of_visits 
FROM person_visits
JOIN person ON person_id = person.id
GROUP BY person.name
ORDER BY 2 DESC, 1
LIMIT 4;


-- Измените оператор SQL из упражнения 00 и верните имя человека (а не идентификатор). 
-- Дополнительный пункт: нам нужно видеть только 4 лучших человека с максимальным 
-- количеством посещений в каждой пиццерии, отсортированных по имени человека.
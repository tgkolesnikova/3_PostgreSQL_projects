SELECT person.name, 
	COUNT(person_id) AS count_of_visits 
FROM person_visits
JOIN person ON person.id = person_id
GROUP BY person.name
HAVING COUNT(person_id) > 3
ORDER BY 1;


-- оператор SQL, который возвращает имя человека и соответствующее количество 
-- посещений любой пиццерии, если человек посетил более 3 раз (> 3)
-- Denied: WHERE
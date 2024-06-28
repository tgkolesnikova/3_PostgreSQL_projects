SELECT person_id, COUNT(id) AS count_of_visits FROM person_visits
GROUP BY person_id
ORDER BY 2 DESC, 1;


-- оператор SQL, который возвращает идентификаторы людей и соответствующее 
-- количество посещений в любых пиццериях, сортирует по количеству посещений 
-- в режиме убывания и person_id по возрастанию
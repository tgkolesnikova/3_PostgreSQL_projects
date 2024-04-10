SELECT order_date, CONCAT(person.name, ' (age:',person.age,')') AS person_information
FROM 
	(SELECT order_date, person_id AS id 
	 FROM person_order) AS p
NATURAL JOIN person 
ORDER BY order_date, person_information;


-- Перепишите оператор SQL из упражнения № 07, используя конструкцию NATURAL JOIN. 
-- Результат должен быть таким же, как в упражнении №07.
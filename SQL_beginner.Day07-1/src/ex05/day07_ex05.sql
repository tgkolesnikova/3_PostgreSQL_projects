SELECT DISTINCT person.name FROM person_order
JOIN person ON person.id = person_id
ORDER BY 1;


-- SQL-запрос, который возвращает список уникальных имен людей, 
-- разместивших заказы в любых пиццериях. 
-- Результат должен быть отсортирован по имени человека. 
-- Denied: GROUP BY, любой тип (UNION,...) работающий с множествами
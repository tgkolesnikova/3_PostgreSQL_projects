SELECT DISTINCT name as pizzeria_name FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON menu.id = person_order.menu_id
WHERE person_id IN (
	SELECT id FROM person
	WHERE gender = 'female'   
)
EXCEPT
SELECT DISTINCT name FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON menu.id = person_order.menu_id
WHERE person_id IN (
	SELECT id FROM person
	WHERE gender = 'male'   
)
ORDER BY pizzeria_name;


-- Найдите объединение пиццерий, которые заказывают как женщины, так и мужчины. 
-- Другими словами, вам необходимо найти набор названий пиццерий, которые заказывали только
-- женщины, и провести операцию «UNION» с набором названий пиццерий, которые заказывали только мужчины. 
-- Для всех операторов SQL с наборами не сохраняются дубликаты (UNION, EXCEPT, INTERSECT). 
-- Отсортируйте результат по названию пиццерии.
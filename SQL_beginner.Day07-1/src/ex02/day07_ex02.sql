	(SELECT pizzeria.name, 
		COUNT(*), 
		'visit' as action_type 
	FROM person_visits
	JOIN pizzeria ON pizzeria_id = pizzeria.id
	GROUP BY pizzeria.name
	ORDER BY 2 DESC
	LIMIT 3)
UNION ALL
	(SELECT pizzeria.name, 
		COUNT(*), 
		'order' as action_type 
	FROM person_order
	JOIN menu ON menu_id = menu.id
	JOIN pizzeria ON pizzeria_id = pizzeria.id
	GROUP BY pizzeria.name
	ORDER BY 2 DESC
	LIMIT 3)
ORDER BY action_type, 2 DESC;


-- оператор SQL, чтобы просмотреть 3 любимых ресторана по посещениям и заказам 
-- (добавьте столбец action_type со значениями «заказ» или «посещение», 
-- это зависит от данных из соответствующей таблицы)/ Результат должен быть отсортирован 
-- по возрастанию по столбцу action_type и по убыванию по столбцу count.
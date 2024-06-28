WITH actions AS(
	(SELECT pizzeria.name, COUNT(*)	FROM person_visits
	JOIN pizzeria ON pizzeria_id = pizzeria.id
	GROUP BY pizzeria.name)
		UNION ALL
	(SELECT pizzeria.name, COUNT(*) FROM person_order
	JOIN menu ON menu_id = menu.id
	JOIN pizzeria ON pizzeria_id = pizzeria.id
	GROUP BY pizzeria.name)
)
	
SELECT name, SUM(count) AS total_count FROM actions
GROUP BY name
ORDER BY 2 DESC, 1;



-- оператор SQL, чтобы увидеть, как рестораны группируются по посещениям и заказам 
-- и объединяются по названию ресторана. Добавьте следующие правила:
    -- посчитайте сумму заказов и посещений соответствующей пиццерии (обратите внимание, 
    -- что не все ключи пиццерий представлены в обеих таблицах);
    -- отсортируйте результаты по столбцу total_count в порядке убывания и по столбцу name в порядке возрастания.
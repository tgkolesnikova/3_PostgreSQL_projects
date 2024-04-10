INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES (GENERATE_SERIES(((SELECT max(id) FROM person_order) + 1),
					    ((SELECT max(id) FROM person_order) + (SELECT count(id) FROM person))),
		GENERATE_SERIES((SELECT min(id) FROM person), (SELECT count(id) FROM person)), 
		(SELECT id FROM menu WHERE pizza_name = 'Greek pizza'),
		'2022-02-25');



-- Зарегистрируйте новые заказы всех лиц на "Greek pizza" 25 февраля 2022 года.
-- Внимание : это упражнение, вероятно, приведет к неправильному изменению данных. 

-- Denied: Не используйте прямые цифры для идентификаторов первичного ключа и меню.
        -- Не используйте оконные функции, такие как ROW_NUMBER( )
        -- Не используйте атомарные INSERT операторы |
-- Allowed: SQL Syntax Construction: generate_series(...)
        -- SQL Syntax Patten: Please use “insert-select” pattern INSERT INTO ... SELECT ...
INSERT INTO person_order 
VALUES ((SELECT max(id) FROM person_order) + 1,
		(SELECT id FROM person WHERE name = 'Denis'),
		(SELECT id FROM menu WHERE pizza_name = 'Sicilian pizza'),
		'2022-02-24'),
		
	   ((SELECT max(id) FROM person_order) + 2,
		(SELECT id FROM person WHERE name = 'Irina'),
		(SELECT id FROM menu WHERE pizza_name = 'Sicilian pizza'),
		'2022-02-24');


-- Зарегистрируйте новые заказы от Дениса и Ирины 24 февраля 2022 года на новое меню от "Sicilian pizza".
-- Предупреждение : это упражнение, вероятно, приведет к неправильному изменению данных. 

-- Denied: Не используйте прямые номера для идентификаторов первичного ключа и пиццерии.
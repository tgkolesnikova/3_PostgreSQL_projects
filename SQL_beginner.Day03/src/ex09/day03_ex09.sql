INSERT INTO person_visits 
VALUES ((SELECT max(id) FROM person_visits) + 1,
	    (SELECT id FROM person WHERE name = 'Denis'),
		(SELECT id FROM pizzeria WHERE name = 'Dominos'),
		'2024-02-24'),
	
	   ((SELECT max(id) FROM person_visits) + 2,
		(SELECT id FROM person WHERE name = 'Irina'),
		(SELECT id FROM pizzeria WHERE name = 'Dominos'),
		'2024-02-24');




-- запишите новые посещения ресторана Domino's Денисом и Ириной 24 февраля 2022 г.
-- Внимание! Это упражнение может привести к неправильному изменению данных.

-- Denied: Не используйте прямые номера для идентификаторов первичного ключа и пиццерии.
INSERT INTO person_visits
VALUES ((SELECT max(id) FROM person_visits) + 1,
		(SELECT id FROM person WHERE name = 'Dmitriy'),
		(SELECT id FROM pizzeria WHERE name = 'DoDo Pizza'),
		'2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;


-- Давайте обновим данные в нашем материализованном представлении mv_dmitriy_visits_and_eats из упражнения № 06.
-- Перед этим действием создайте еще одно посещение Дмитрия, которое удовлетворяет предложению SQL 
-- материализованного представления, за исключением пиццерии, которую мы видим в результате упражнения № 06. 
-- После добавления нового посещения обновите состояние данных для mv_dmitriy_visits_and_eats.
-- Denied: Не используйте прямые номера для идентификаторов первичного ключа, человека и пиццерии.
SELECT order_date AS action_date, person_id FROM person_order
UNION
SELECT visit_date, person_id FROM person_visits 
WHERE EXISTS (SELECT * FROM person_order
			WHERE person_order.person_id = person_visits.person_id
			AND person_order.order_date = person_visits.visit_date
			)
ORDER BY action_date, person_id DESC;



-- возвращает общие строки для атрибутов order_date, person_id из таблицы person_order
-- с одной стороны и visit_date, person_id из таблицы person_visits с другой стороны. 
-- Другими словами, найдем идентификаторы людей, которые в тот же день зашли и заказали пиццу. 
-- добавьте упорядочение по action_date в возрастающем режиме, 
-- а затем по person_id в нисходящем режиме.
-- Denied: любой тип JOIN
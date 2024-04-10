SELECT order_date AS action_date, (
	SELECT name FROM person WHERE id = person_order.person_id
) AS person_name FROM person_order

UNION

SELECT visit_date, (
	SELECT name FROM person WHERE id = person_visits.person_id
) FROM person_visits
WHERE EXISTS (SELECT * FROM person_order
			WHERE person_order.person_id = person_visits.person_id
			AND person_order.order_date = person_visits.visit_date
			)
ORDER BY action_date, person_name DESC;


-- изменим наш оператор SQL по упражнению № 03, чтобы он возвращал имена людей вместо
-- идентификаторов людей, и изменим порядок действий по action_date в возрастающем режиме,
-- а затем по person_name в нисходящем режиме. 
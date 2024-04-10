SELECT
	(SELECT name FROM person WHERE id = person_order.person_id) AS name,
	CASE (SELECT name FROM person WHERE id = person_order.person_id)
		WHEN 'Denis' THEN true 
		ELSE false 
		END AS check_name
FROM person_order
WHERE order_date = '2022-01-07' AND (menu_id = 13 OR menu_id = 14 OR menu_id = 18);


-- use SQL construction from Exercise 05 and add a new calculated column 
-- (use column's name ‘check_name’) with a check statement in the SELECT clause.
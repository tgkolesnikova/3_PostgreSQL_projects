WITH calc_discount AS (
	SELECT person_id, pizzeria_id, 
		CASE 
			WHEN (COUNT(person_id) = 1) THEN 10.5
			WHEN (COUNT(person_id) = 2) THEN 22
			ELSE 30
		END AS discount	
	FROM person_order
	JOIN menu ON menu_id = menu.id
	GROUP BY person_id, pizzeria_id
	ORDER BY 1, 2
)

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER() AS id, person_id, pizzeria_id, discount
FROM calc_discount;


-- есть таблица person_order, в которой хранится история заказов человека. 
-- Напишите оператор DML ( INSERT INTO ... SELECT ...), который будет вставлять 
-- новые записи в person_discounts на основе заданных правил.
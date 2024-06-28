CREATE VIEW v_price_with_discount AS
(
	SELECT DISTINCT person.name, 
					menu.pizza_name, 
					menu.price as price,
					round(price - price * 0.1) as discount_price
	FROM person_order
	JOIN person ON person_id = person.id 
	JOIN menu ON menu_id = menu.id
	ORDER BY person.name, menu.pizza_name
);




-- Создайте представление базы данных v_price_with_discount, которое возвращает заказы человека 
-- с именем человека, названием пиццы, реальной ценой и расчетным столбцом discount_price
-- (с примененной скидкой 10 % и удовлетворяющей формулой price - price*0.1). 
-- Отсортируйте результат по именам людей и названиям пицц и преобразуйте столбец 
-- discount_price в целочисленный тип. 
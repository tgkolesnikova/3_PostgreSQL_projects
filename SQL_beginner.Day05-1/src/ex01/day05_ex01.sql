-- принудительно включить сканирование по индексу
SET enable_seqscan TO off; 

EXPLAIN ANALYZE 
SELECT pizza_name, 
	   name as pizzeria_name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;



-- напишите оператор SQL, который возвращает пиццу и соответствующие названия пиццерий. 
-- (сортировка не требуется). Давайте докажем, что ваши индексы работают для вашего SQL. 
-- Примером доказательства является вывод команды EXPLAIN ANALYZE 
-- "->  Index Scan using idx_menu_pizzeria_id on menu m  (...)"
CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

-- принудительно включить сканирование по индексу
SET enable_seqscan TO off; 

-- SQL-запрос для демонстрации того, что индекс работает
EXPLAIN ANALYZE
SELECT * FROM menu
WHERE pizzeria_id = 4 OR pizza_name = 'pepperoni pizza';




-- Создайте уникальный индекс BTree с именем idx_menu_unique в таблице menu
-- для столбцов pizzeria_id и pizza_name. Напишите и предоставьте любой SQL 
-- с доказательством (EXPLAIN ANALYZE) того, что индекс idx_menu_unique работает.
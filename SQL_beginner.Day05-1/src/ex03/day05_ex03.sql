CREATE INDEX idx_person_order_multi ON person_order (person_id, menu_id, order_date);

-- принудительно включить сканирование по индексу
SET enable_seqscan TO off; 

-- SQL-запрос для демонстрации того, что индекс работает
EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;



-- создайте лучший индекс B-дерева с несколькими столбцами, названный idx_person_order_multi
-- в честь приведенного оператора SQL. Предоставьте любой SQL с доказательством
-- (EXPLAIN ANALYZE) того, что индекс idx_person_order_multi работает.
-- Команда EXPLAIN ANALYZE должна вернуть шаблон со словами «Index Only Scan...»!
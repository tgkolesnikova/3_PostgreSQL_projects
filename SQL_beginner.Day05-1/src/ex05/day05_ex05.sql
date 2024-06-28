CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';

-- принудительно включить сканирование по индексу
SET enable_seqscan TO off; 

-- SQL-запрос для демонстрации того, что индекс работает
EXPLAIN ANALYZE
SELECT person_id, menu_id FROM person_order
WHERE order_date = '2022-01-01';





-- Создайте частично уникальный индекс BTree с именем idx_person_order_order_date 
-- в таблице person_order для атрибутов person_id и menu_id с частичной уникальностью 
-- столбца для order_date на дату «01.01.2022».
-- Команда EXPLAIN ANALYZEдолжна вернуть заданный шаблон
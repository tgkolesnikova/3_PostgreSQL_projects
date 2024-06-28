CREATE INDEX idx_person_name ON person (upper(name));

-- принудительно включить сканирование по индексу
SET enable_seqscan TO off; 

-- SQL-запрос для демонстрации того, что индекс работает
EXPLAIN ANALYZE
SELECT name, address FROM person
WHERE upper(name) = 'ANNA';



-- Создайте функциональный индекс B-дерева, названный idx_person_name по имени 
-- столбца таблицы person. Индекс должен содержать имена людей в верхнем регистре.
-- Напишите и предоставьте любой SQL с доказательством (EXPLAIN ANALYZE), 
-- что индекс idx_person_name работает.
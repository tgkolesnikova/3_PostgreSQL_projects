CREATE UNIQUE INDEX idx_person_discounts_unique 
ON person_discounts (person_id, pizzeria_id);

-- принудительно включить сканирование по индексу
SET enable_seqscan TO off; 

-- SQL-запрос для демонстрации того, что индекс работает
EXPLAIN ANALYZE
SELECT * FROM person_discounts
WHERE person_id = 1 AND pizzeria_id = 1;



-- Создайте уникальный индекс из нескольких столбцов (с именем idx_person_discounts_unique), 
-- который предотвратит дублирование пар идентификаторов человека и пиццерии.
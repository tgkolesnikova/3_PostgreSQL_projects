-- принудительно отключим сканирование по индексу
SET enable_seqscan TO on; 

-- SQL-запрос для демонстрации работы без использования индекса
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
	max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;

-- создадим новый индекс (перед новым тестом удалите индекс idx_1)
CREATE INDEX idx_1 ON pizzeria (rating);

-- принудительно включаем сканирование по индексу
SET enable_seqscan TO off; 

-- SQL-запрос, демонстрирующий работу с использованием индекса idx_1
EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
	max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1, 2;
 
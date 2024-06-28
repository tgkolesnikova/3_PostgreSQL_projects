CREATE VIEW v_symmetric_union AS
(
  (
	SELECT person_id FROM person_visits
	WHERE visit_date <= '2022-01-02' 
	EXCEPT
	SELECT person_id FROM person_visits
	WHERE visit_date <= '2022-01-06'
  )
  UNION
  (
	SELECT person_id FROM person_visits
	WHERE visit_date <= '2022-01-06' 
	EXCEPT
	SELECT person_id FROM person_visits
	WHERE visit_date <= '2022-01-02'
  )
ORDER BY person_id
);


-- Напишите оператор SQL, удовлетворяющий формуле (R - S)∪(S - R). Где R — это таблица person_visits с 
-- фильтром до 2 января 2022 г., S — это также таблица person_visits но с другим фильтром до 6 января 2022 г. 
-- Выполните расчеты с столбцом person_id и в результате этот столбец будет один. 
-- Пожалуйста, отсортируйте результат по столбцу person_id  и представьте окончательный SQL 
-- в виде представления v_symmetric_union.
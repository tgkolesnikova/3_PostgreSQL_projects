WITH missing_date AS
	(SELECT missing_date::date FROM
	 GENERATE_SERIES('2022-01-01', '2022-01-10', interval '1 day') as missing_date)
SELECT missing_date FROM missing_date
LEFT JOIN 
	(SELECT visit_date, person_id FROM person_visits
	 WHERE person_id in (1, 2)) as p
ON missing_date = p.visit_date
WHERE p.person_id is null
ORDER BY missing_date;


-- Перепишите свой SQL, используя шаблон CTE (Common Table Expression). 
-- переместите в часть CTE ваш «генератор дней». 
-- Результат должен быть таким же, как в упражнении № 01.
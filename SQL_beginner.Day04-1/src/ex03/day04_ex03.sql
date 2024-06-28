SELECT generated_date as missing_date FROM v_generated_dates 
WHERE generated_date NOT IN (
		SELECT visit_date FROM person_visits
	)
ORDER BY missing_date;



-- Напишите инструкцию SQL, которая возвращает пропущенные дни для посещений людей в январе 2022 года. 
-- Используйте представление v_generated_dates для этой задачи 
-- и отсортируйте результат по столбцу Missing_date.
SELECT object_name FROM (
	SELECT name AS object_name, 1 AS num FROM person
	UNION ALL
	SELECT pizza_name, 2 FROM menu
) AS a
ORDER BY num, object_name;



-- Измените оператор SQL из «упражнения 00», удалив столбец object_id. 
-- Затем измените порядок по имени объекта для части данных из таблицы person, 
-- а затем из таблицы menu. 
-- сохраняйте дубликаты
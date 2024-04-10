SELECT id as menu_id FROM menu
WHERE id NOT IN (
	SELECT menu_id FROM person_order
)
ORDER BY id;


-- Найдите все идентификаторы меню, которые никем не заказаны. 
-- Результат должен быть отсортирован по идентификатору.
-- Denied: any type of JOINs
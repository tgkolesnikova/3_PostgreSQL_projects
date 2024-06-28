SELECT address, 
	ROUND((MAX(age::numeric) - MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
	ROUND(AVG(age::numeric), 2) AS average,
	(MAX(age::numeric) - MIN(age::numeric) / MAX(age::numeric)) > AVG(age::numeric) AS comparison
FROM person
GROUP BY address
ORDER BY address;


-- оператор SQL, который возвращает агрегированную информацию по адресу человека, 
-- результат «Макс.возраст - (Мин.возраст / Макс.возраст)», в виде столбца формулы,
-- затем средний возраст по адресу и результат сравнения между столбцами формулы и
-- среднего значения (True, если формула больше среднего, иначе — значение False).
-- Результат должен быть отсортирован по столбцу адреса.
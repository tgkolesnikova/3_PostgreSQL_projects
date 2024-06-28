-- начать транзакцию в сеансе № 1 и в сеансе № 2:
BEGIN;   -- сеанс № 1
BEGIN;   -- сеанс № 2

-- внести изменения в запись с id=1 таблицы pizzeria в сеансе № 1:
UPDATE pizzeria SET rating = 4.6 WHERE id = 1; -- успешно

-- внести изменения в запись с id=2 таблицы pizzeria в сеансе № 2:
UPDATE pizzeria SET rating = 5 WHERE id = 2; -- успешно

-- внести изменения в запись с id=2 таблицы pizzeria в сеансе № 1:
UPDATE pizzeria SET rating = 3.8 WHERE id = 2; -- успешно
COMMIT;   -- успешно

-- внести изменения в запись с id=1 таблицы pizzeria в сеансе № 2:
UPDATE pizzeria SET rating = 4.2 WHERE id = 1; -- обнаружена взаимоблокировка
COMMIT;    -- откат
-- Все операции показаны на screenshot_07_1.jpg

------------------------------------------------------------------
-- итоговое состояние таблицы pizzeria (screenshot_07_2.jpg):
SELECT * FROM pizzeria ORDER BY 1;  -- сеанс № 1
SELECT * FROM pizzeria ORDER BY 1;  -- сеанс № 2
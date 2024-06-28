-- начать блок транзакции в сеансе № 1 и сеансе № 2, проверить, что  
-- текущий уровень изоляции READ COMMITED (screenshot_03_1.jpg) и 
-- проверить рейтинг «Pizza Hut» в сеансе № 1:
BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';   -- 4 (сеанс № 1)

-- довести рейтинг до значения 3.6 в сеансе № 2 и зафиксировать транзакцию (screenshot_03_2.jpg):
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- еще раз проверить рейтинг «Pizza Hut» в сеансе № 1 (screenshot_03_3.jpg):
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';   -- внезапно 3.6

-- фиксируем транзакцию в сеансе № 1, и проверяем значения рейтинга в обоих 
-- сеансах (screenshot_03_4.jpg):
COMMIT;  -- сеанс № 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';   -- 3.6 (сеанс № 1)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';   -- 3.6 (сеанс № 2)


-- Вывод: транзакция в сеансе № 1 столкнулась с разными значениями рейтинга (то 4, то 3.6)
-- во время выполнения SELECT из-за того, что параллельная транзакция в сеансе № 2 успела
-- поменять его. Уровень изоляции READ COMMITED не ограждает от аномалии "Неповторяющееся чтение".
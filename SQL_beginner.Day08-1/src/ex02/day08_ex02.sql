-- начать блок транзакции в сеансе № 1 и сеансе № 2, установить и проверить 
-- уровень изоляции REPEATABLE READ (screenshot_02_1.jpg):
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

-- проверить рейтинг «Pizza Hut» в режиме транзакции для обоих сеансов (screenshot_02_2.jpg):
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';  -- 4.6

-- довести рейтинг до значения 4 в сеансе № 1 и до значения 3.6 в сеансе № 2 (screenshot_02_3.jpg):
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';  -- сеанс № 1
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';  -- сеанс № 2 (он подвисает на время)

-- зафиксировать текущую транзакцию в сеансе № 1 (screenshot_02_4.jpg):
COMMIT;

-- зафиксировать текущую транзакцию в сеансе № 2 (screenshot_02_5.jpg):
COMMIT;  -- происходит откат транзакции 

-- опять проверить рейтинг «Pizza Hut» для обоих сеансов (screenshot_02_6.jpg):
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Вывод: значение рейтинга 4 зафиксировано в таблице pizzeria как результат 
-- выполнения более ранней транзакции, а транзакция сеанса № 2 отменена. Уровень
-- изоляции REPEATABLE READ предохраняет от аномалии потери обновления.
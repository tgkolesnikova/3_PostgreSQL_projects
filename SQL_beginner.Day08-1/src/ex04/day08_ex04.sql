-- начать блок транзакции в сеансе № 1 и сеансе № 2, установить и проверить  
-- текущий уровень изоляции SERIALIZABLE (screenshot_04_1.jpg):
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;

-- проверить рейтинг «Pizza Hut» в сеансе № 1 (screenshot_04_2.jpg):
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';   -- 3.6

-- довести рейтинг до значения 3 в сеансе № 2 и зафиксировать его (screenshot_04_3.jpg):
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
COMMIT;

-- еще раз проверить рейтинг «Pizza Hut» в сеансе № 1 (screenshot_04_4.jpg):
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';   -- по прежнему 3.6

-- фиксируем транзакцию в сеансе № 1, и проверяем значения рейтинга в обоих 
-- сеансах (screenshot_04_5.jpg):
COMMIT;  -- сеанс № 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';   -- 3 (сеанс № 1)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';   -- 3 (сеанс № 2)


-- Вывод: транзакция в сеансе № 1 не видела изменения рейтинга, вносимые 
-- транзакцией в сеансе № 2, пока не закончила свое выполнение. 
-- Уровень изоляции SERIALIZABLE защищает от аномалии "Неповторяющееся чтение".
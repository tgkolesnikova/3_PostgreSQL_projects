-- начать блок транзакции в сеансе № 1 и сеансе № 2, установить и проверить 
-- уровень изоляции REPEATABLE READ (screenshot_06_1.jpg):
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;

-- просуммировать все рейтинги для всех пиццерий в одном режиме транзакции для сеанса №1, 
-- а затем создать новый ресторан «Kazan Pizza 2» с рейтингом 4 и ID=11 
-- и завершить транзакцию в сеансе №2 (screenshot_06_2.jpg):
SELECT sum(rating) FROM pizzeria;  -- 26.9
INSERT INTO pizzeria VALUES (11, 'Kazan Pizza 2', 4);
COMMIT;

-- еще раз просуммировать все рейтинги для всех пиццерий в сеансе №1 
-- и закончить транзакцию (screenshot_06_3.jpg):
SELECT sum(rating) FROM pizzeria;  -- 26.9
COMMIT;

-- по окончании всех транзакций снова просуммировать все рейтинги для всех пиццерий
-- для сеанса №1 и для сеанса № 2 (screenshot_06_4.jpg):
SELECT sum(rating) FROM pizzeria;  -- 30.9 (сеанс № 1)
SELECT sum(rating) FROM pizzeria;  -- 30.9 (сеанс № 2)


-- Вывод: транзакция в сеансе № 1 в процессе своей работы не реагирует на появление новой 
-- строки в таблице. Уровень изоляции REPEATABLE READ спасает от аномалии "Фантомное чтение".
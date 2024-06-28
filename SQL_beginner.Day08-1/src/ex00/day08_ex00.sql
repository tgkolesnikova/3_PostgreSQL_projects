-- Session #1: 
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria;  -- 5

-- Session #2:
SELECT * FROM pizzeria;  -- 4.6

-- результат показан на Screenshot_00_1.jpg


----------------------------------------
-- Session #1: 
COMMIT;
SELECT * FROM pizzeria;  -- 5

-- Session #2:
SELECT * FROM pizzeria;  -- 5

-- результат показан на Screenshot_00_2.jpg
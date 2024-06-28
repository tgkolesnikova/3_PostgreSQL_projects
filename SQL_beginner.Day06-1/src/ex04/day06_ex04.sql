ALTER TABLE IF EXISTS person_discounts
  ADD CONSTRAINT ch_nn_person_id CHECK(person_id IS NOT NULL),
  ADD CONSTRAINT ch_nn_pizzeria_id CHECK(pizzeria_id IS NOT NULL),
  ADD CONSTRAINT ch_nn_discount CHECK(discount IS NOT NULL),
  ALTER COLUMN discount SET DEFAULT 0,
  ADD CONSTRAINT ch_range_discount CHECK(0 <= discount AND discount <= 100);


-- Добавьте  правила ограничений для существующих столбцов таблицы person_discounts
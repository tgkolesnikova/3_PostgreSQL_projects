CREATE SEQUENCE seq_person_discounts START WITH 1;
SELECT SETVAL('seq_person_discounts', (SELECT COUNT(id) FROM person_discounts));

ALTER TABLE IF EXISTS person_discounts
	ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');


-- создать последовательность БД с именем seq_person_discounts (начиная со значения 1)
-- и установить значение по умолчанию для атрибута id таблицы person_discounts так, 
-- чтобы каждый раз автоматически принимать следующее значение из seq_person_discounts

-- показать, что добавляется:
-- INSERT INTO person_discounts (person_id, pizzeria_id, discount)
-- VALUES (1, 2, 20);
-- SELECT * FROM person_discounts;

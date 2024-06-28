CREATE VIEW v_generated_dates AS
SELECT generated_date::date 
FROM GENERATE_SERIES('2022-01-01'::date, '2022-01-31', '1 day') AS generated_date
ORDER BY generated_date;



-- Создайте представление базы данных (с именем v_generated_dates), которое должно «хранить» 
-- сгенерированные даты с 1 по 31 января 2022 года в типе DATE. 
-- Не забудьте упорядочить столбец сгенерированной даты.

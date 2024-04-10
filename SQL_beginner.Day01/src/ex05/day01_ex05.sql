SELECT * FROM person
CROSS JOIN pizzeria
ORDER BY person.id, pizzeria.id;


-- возвращает все возможные комбинации между таблицами person и pizzeria,
-- и установите порядок по идентификатору человека, а затем по столбцам
-- идентификатора пиццерии.
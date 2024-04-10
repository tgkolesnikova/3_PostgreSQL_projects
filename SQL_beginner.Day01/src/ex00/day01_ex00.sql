SELECT menu.id AS object_id, pizza_name AS object_name FROM menu
UNION
SELECT person.id, name FROM person
ORDER BY object_id, object_name;



-- Напишите оператор SQL, который возвращает идентификатор меню и 
-- названия пиццы из таблицы menu, а также идентификатор человека и имя человека 
-- из таблицы person в одном глобальном списке (с именами столбцов, как представлено 
-- в примере ниже), упорядоченном по столбцам object_id, а затем по столбцам object_name.
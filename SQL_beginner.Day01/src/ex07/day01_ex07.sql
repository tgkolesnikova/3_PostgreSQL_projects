SELECT order_date, CONCAT(person.name, ' (age:',person.age,')') AS person_information
FROM person_order
JOIN person ON person_order.person_id = person.id
ORDER BY order_date, person_information;


-- возвращает дату заказа из таблицы person_order и имя соответствующего человека
-- (имя и возраст форматируются), который сделал заказ из таблицы person. 
-- Добавьте сортировку по обоим столбцам в порядке возрастания.
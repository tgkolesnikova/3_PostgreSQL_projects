CREATE TABLE IF NOT EXISTS graph (point1 char NOT NULL,
                                              point2 char NOT NULL,
                                                          cost int NOT NULL);


INSERT INTO graph
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('a', 'd', 20),
       ('b', 'a', 10),
       ('b', 'c', 35),
       ('b', 'd', 25),
       ('c', 'a', 15),
       ('c', 'b', 35),
       ('c', 'd', 30),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);
WITH RECURSIVE 
past_tour(past_point, tour) AS
  (SELECT point1, ARRAY[point1]::char(1)[], 0 AS cost
   FROM graph
   WHERE point1 = 'a'
   UNION SELECT graph.point2 AS past_point,
                (past_tour.tour || ARRAY[graph.point2])::char(1)[] AS tour,
                past_tour.cost + graph.cost
   FROM graph,
        past_tour
   WHERE graph.point1 = past_tour.past_point
     AND NOT graph.point2 = ANY(past_tour.tour) ),
result_tour AS
  (SELECT array_append(tour, 'a') AS tour,
          cost +
     (SELECT cost
      FROM graph
      WHERE point1 = past_tour.past_point
        AND point2 = 'a') AS cost
   FROM past_tour
   WHERE
       (SELECT array_length(past_tour.tour, 1)) = 4 )
SELECT cost AS total_cost,
       tour
FROM result_tour
WHERE cost =
    (SELECT MIN(cost)
     FROM result_tour)
ORDER BY total_cost,
         tour;


-- Рекурсивный запрос
-- 1. Создайте таблицу с именованными узлами, используя структуру {point1, point2, cost}, и заполните данные
-- на основе изображения (помните, что между двумя узлами существуют прямые и обратные пути).
-- 2. Напишите оператор SQL, который возвращает все туры (также известные как маршруты) 
-- с минимальной стоимостью проезда, если мы начинаем с города «а».
-- Отсортируйте данные по общей стоимости, а затем по туру.
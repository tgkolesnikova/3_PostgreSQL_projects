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
SELECT cost AS total_cost, tour FROM result_tour
WHERE cost IN
    (SELECT MIN(cost) FROM result_tour
	UNION
	SELECT MAX(cost) FROM result_tour)
ORDER BY total_cost,
         tour;


-- Рекурсивный запрос
-- Добавьте в SQL из предыдущего упражнения способ просмотра дополнительных строк 
-- с наиболее дорогостоящими затратами. Отсортируйте данные по общей стоимости, а затем по поездке.
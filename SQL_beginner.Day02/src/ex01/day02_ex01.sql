SELECT missing_date::date
FROM GENERATE_SERIES('2022-01-01', '2022-01-10', interval '1 day') as missing_date
LEFT JOIN
(SELECT visit_date, person_id FROM person_visits
 WHERE person_id in (1, 2)) as p
ON missing_date = p.visit_date
WHERE p.person_id is null
ORDER BY missing_date;


-- пропущенные дни с 1 по 10 января 2022 года (включая все дни) для посещений 
-- лиц с идентификаторами 1 или 2 (дни, пропущенные обоими). 
-- Дни посещения в порядке возрастания. 
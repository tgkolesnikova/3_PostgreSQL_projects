SELECT id, name, age,
CASE WHEN age >= 10 AND age <= 20 THEN 'interval #1'
	 WHEN age > 20 AND age < 24 THEN 'interval #2'
	 ELSE 'interval #3'
END AS interval_info
FROM person
ORDER BY interval_info 


-- apply data intervals for the person table: make a SQL statement which returns a person's identifiers,
-- person's names and interval of person’s ages (set a name of a new calculated column as ‘interval_info’).
-- sort a result by ‘interval_info’ column in ascending mode.
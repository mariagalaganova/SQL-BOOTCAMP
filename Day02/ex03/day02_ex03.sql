WITH  two_persons AS 
(
    SELECT visit_date
                    FROM person_visits 
                    WHERE person_id = 1
                       OR person_id = 2
)


SELECT day::date AS missing_date
FROM GENERATE_SERIES(timestamp '2022-01-01', '2022-01-10', '1 day') AS day
         LEFT JOIN  two_persons
                   ON day = two_persons.visit_date
WHERE visit_date IS NULL
ORDER BY 1;


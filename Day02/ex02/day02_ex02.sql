WITH three_days AS (SELECT *
                    FROM person_visits AS pv
                    WHERE pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03')

SELECT COALESCE(p.name, '-')  AS person_name,
       three_days.visit_date          AS visit_date,
       COALESCE(pi.name, '-') AS pizzeria_name
FROM person AS p
         FULL JOIN  three_days
                   ON p.id = three_days.person_id
         FULL JOIN pizzeria AS pi
                   ON three_days.pizzeria_id = pi.id
ORDER BY 1, 2, 3
  
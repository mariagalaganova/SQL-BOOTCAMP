WITH pizzeria_visit AS (SELECT pizzeria_id FROM person_visits)


SELECT name AS name
FROM pizzeria
WHERE id NOT IN (SELECT * FROM pizzeria_visit);



SELECT name AS name
FROM pizzeria
WHERE  NOT EXISTS (SELECT 1 FROM person_visits pv WHERE pv.pizzeria_id = pizzeria.id)
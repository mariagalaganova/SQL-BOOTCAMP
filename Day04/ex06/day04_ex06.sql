CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats
AS
WITH visits AS (SELECT * 
                FROM person_visits 
                         RIGHT JOIN (SELECT *
                                     FROM person 
                                     WHERE person.name = 'Dmitriy') AS people
                                    ON person_visits.person_id = people.id
                WHERE person_visits.visit_date = '2022-01-08'),
     pizzerias AS (SELECT pizzeria.id AS pi_id, pizzeria.name 
                   FROM pizzeria
                            JOIN visits ON pizzeria.id = visits.pizzeria_id),
     prices AS (SELECT pizzerias.name, 
                       menu.price
                FROM pizzerias
                         JOIN menu ON pizzerias.pi_id = menu.pizzeria_id)
SELECT DISTINCT prices.name
FROM prices 
WHERE prices.price < 800;


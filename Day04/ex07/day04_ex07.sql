INSERT INTO person_visits
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
        (SELECT person.id FROM person  WHERE person.name = 'Dmitriy'),
        (SELECT q1.id
         FROM (SELECT *
               FROM pizzeria pi) q1
                  JOIN (SELECT * FROM menu  WHERE menu.price < 800) q2
                       ON q1.id = q2.pizzeria_id
         EXCEPT
          (SELECT pizzeria.id
          from pizzeria 
          join mv_dmitriy_visits_and_eats 
          on pizzeria.name = mv_dmitriy_visits_and_eats.name)
         ORDER BY 1
         LIMIT 1),
        TIMESTAMP '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
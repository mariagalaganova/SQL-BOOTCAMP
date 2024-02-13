WITH visits_and_orders AS ((SELECT pizzeria.name,
                       COUNT(*)AS count,
                       'visit' AS action_type
                FROM person_visits 
                         JOIN pizzeria  ON person_visits.pizzeria_id = pizzeria.id
                GROUP BY 1
                ORDER BY 2 DESC
                --LIMIT 3
                )

                 UNION 

                 (SELECT pizzeria.name,
                       COUNT(*) AS count,
                       'order' AS action_type
                FROM person_order 
                         JOIN menu ON person_order.menu_id = menu.id
                         JOIN pizzeria  ON menu.pizzeria_id = pizzeria.id
                GROUP BY 1
                ORDER BY 2 DESC
                --LIMIT 3
                ))

SELECT name,
        SUM(count) AS total_count
FROM visits_and_orders
GROUP BY name
ORDER BY 2 DESC

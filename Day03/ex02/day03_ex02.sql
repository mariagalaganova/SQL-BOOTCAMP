WITH not_ordered_pizza AS (SELECT id AS menu_id
FROM menu

EXCEPT

SELECT menu_id
FROM person_order

ORDER BY 1)

SELECT pizza_name,
        price,
        pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id
WHERE menu.id IN (SELECT * FROM not_ordered_pizza)
ORDER BY 1, 2
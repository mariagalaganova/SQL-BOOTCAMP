SELECT person.name, menu.pizza_name, menu.price, (menu.price / 100 * (100 - person_discounts.discount)) as discount_price
FROM person_discounts
JOIN person ON person.id = person_discounts.id
JOIN menu ON menu.pizzeria_id = person_discounts.pizzeria_id
ORDER BY 1, 2;



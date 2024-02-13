CREATE VIEW v_price_with_discount
AS
WITH orders AS (SELECT person.name, menu.pizza_name, menu.price
                FROM person_order 
                         JOIN person ON person_order.person_id = person.id
                         JOIN menu ON person_order.menu_id = menu.id)
SELECT *,
       ROUND(orders.price * 0.9) AS discount_price
FROM orders
ORDER BY 1, 2;
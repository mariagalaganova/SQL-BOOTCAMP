SELECT pizzeria.name, COUNT(*) count_of_orders, round(AVG(menu.price), 2) average_price,
	MAX(menu.price) max_price, MIN(menu.price) min_price
FROM pizzeria 
INNER JOIN menu  ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_order  ON person_order.menu_id = menu.id
GROUP BY 1
ORDER BY name
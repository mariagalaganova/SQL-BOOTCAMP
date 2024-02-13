WITH first AS (SELECT menu.pizza_name,
                     pizzeria.name,
                     menu.price,
                     pizzeria.id
              FROM menu 
                       JOIN pizzeria 
                            ON menu.pizzeria_id = pizzeria.id)
SELECT second.pizza_name,
       second.name   AS pizzeria_name_1,
       first.name AS pizzeria_name_2,
       second.price
FROM (SELECT * FROM first) second
         JOIN first ON second.price = first.price 
         AND second.pizza_name = first.pizza_name 
         AND second.id > first.id
ORDER BY 1;

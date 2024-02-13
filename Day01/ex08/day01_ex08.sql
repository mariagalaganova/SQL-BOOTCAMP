SELECT order_date,
name ||'(age:'||age||')' AS person_information
     
FROM   person_order 
    NATURAL JOIN (select p.id AS  person_id, name, age from person p ) AS p

ORDER BY order_date,
name
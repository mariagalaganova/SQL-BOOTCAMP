SELECT (select name from person where person_id = person.id) AS person_name,
       (select name from pizzeria where pizzeria_id = pizzeria.id) as pizzeria_name
FROM (select * from person_visits where visit_date between '2022-01-07' and '2022-01-09') as pv
order by person_name,
pizzeria_name desc;

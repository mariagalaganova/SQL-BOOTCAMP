select id,
       name,
       age,
       case
           when age BETWEEN 10 AND 20 THEN 'interval #1'
           when age > 20 AND age < 24 THEN 'interval #2'
           ELSE 'interval #3'
           END AS interval_info
from person
order by interval_info;

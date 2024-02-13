

WITH apdate_data AS (SELECT balance.user_id     AS user_id,
                        balance.money,
                        balance.updated,
                        currency.name        AS cur_name,
                        currency.rate_to_usd AS cur_rate,
                        currency.updated     AS cur_updated
                 FROM balance
                          JOIN currency 
                               ON balance.currency_id = currency.id),

     all_join AS (SELECT max_upd.id,max_upd.cur_name,max_upd.money,max_upd.updated, COALESCE(min_upd.diff,max_upd.diff) new_diff
                  FROM (SELECT apdate_data.user_id AS id, cur_name, money, updated, MIN(updated - cur_updated) AS diff
                        FROM apdate_data
                        WHERE updated - cur_updated > INTERVAL '0 days'
                        GROUP BY 1, 2, 3, 4) min_upd
                           FULL JOIN (SELECT apdate_data.user_id AS id,
                                             cur_name,
                                             money,
                                             updated,
                                             MAX(updated - cur_updated) AS diff
                                      FROM apdate_data
                                      WHERE updated - cur_updated < INTERVAL '0 days'
                                      GROUP BY 1, 2, 3, 4)max_upd
                                     ON min_upd.id =max_upd.id AND min_upd.cur_name =max_upd.cur_name AND min_upd.money =max_upd.money AND
                                        min_upd.updated =max_upd.updated)

SELECT COALESCE(use.name, 'not defined'),
       COALESCE(use.lastname, 'not defined'),
       all_join.cur_name,
       all_join.money * currency.rate_to_usd AS currency_in_usd
FROM all_join 
         LEFT JOIN "user" use ON all_join.id = use.id
         LEFT JOIN currency  ON all_join.new_diff = (all_join.updated - currency.updated) AND all_join.cur_name = currency.name
ORDER BY 1 DESC, 2 ASC, 3 ASC;



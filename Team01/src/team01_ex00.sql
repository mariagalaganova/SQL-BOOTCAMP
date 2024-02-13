WITH user_volume
         AS (SELECT COALESCE(use.name, 'not defined')     AS name,
                    COALESCE(use.lastname, 'not defined') AS lastname,
                    balance.type                              AS type,
                    SUM(balance.money)                        AS volume,
                    balance.currency_id
             FROM "user" AS use
                      FULL JOIN balance balance ON use.id = balance.user_id
             GROUP BY balance.type, COALESCE(use.lastname, 'not defined'), COALESCE(use.name, 'not defined'), currency_id),
     big_user_volume

         AS (SELECT user_volume.name,
                     user_volume.lastname, 
                     user_volume.type, 
                     user_volume.volume, 
                     COALESCE(c.name, 'not defined') AS currency_name, user_volume.currency_id
             FROM user_volume 
                      LEFT JOIN currency AS c ON c.id = user_volume.currency_id
             GROUP BY user_volume.name,
                     user_volume.lastname, 
                     user_volume.type, 
                     user_volume.volume, 
                     COALESCE(c.name, 'not defined'), 
                     user_volume.currency_id),
     currency_data
         AS (SELECT currency.id,
                    name,
                    rate_to_usd,
                    lastdate
             FROM (SELECT id,
                          MAX(updated) AS lastdate
                   FROM currency
                   GROUP BY 1) q1
                      LEFT JOIN currency ON q1.lastdate = currency.updated AND q1.id = currency.id)

SELECT big_user_volume.name AS name,
       lastname AS lastname,
       type,
       volume,
       currency_name,
       COALESCE(rate_to_usd, 1) AS last_rate_to_usd,
       COALESCE(volume * rate_to_usd, volume) AS total_volume_in_usd
FROM big_user_volume

         LEFT JOIN currency_data ON currency_data.id = big_user_volume.currency_id
ORDER BY 1 DESC, 2 ASC, 3 ASC;
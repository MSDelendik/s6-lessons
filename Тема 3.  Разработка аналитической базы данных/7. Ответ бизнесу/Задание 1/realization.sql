WITH users AS (
select hk_user_id
from MLDELENDIKYANDEXRU__DWH.l_user_message
where hk_message_id in (select hk_message_id
                        from MLDELENDIKYANDEXRU__DWH.l_groups_dialogs
                        where hk_group_id in (select hk_group_id
                                            from MLDELENDIKYANDEXRU__DWH.h_groups
                                            order by registration_dt limit 10))
)
SELECT 
age,
count(DISTINCT u.hk_user_id) AS cnt
FROM users u
INNER JOIN MLDELENDIKYANDEXRU__DWH.s_user_socdem suc ON u.hk_user_id=suc.hk_user_id
GROUP BY 1
ORDER BY cnt DESC
LIMIT 5;
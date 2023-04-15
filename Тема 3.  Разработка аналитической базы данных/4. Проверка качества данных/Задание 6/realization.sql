SELECT count(DISTINCT admin_id)
FROM MLDELENDIKYANDEXRU__STAGING.groups AS g 
LEFT JOIN MLDELENDIKYANDEXRU__STAGING.users AS u 
ON g.admin_id = u.id
WHERE u.id IS NULL;
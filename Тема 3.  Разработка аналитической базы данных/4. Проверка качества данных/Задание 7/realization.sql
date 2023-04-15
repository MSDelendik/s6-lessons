(SELECT count(1), 'missing group admin info' as info
FROM MLDELENDIKYANDEXRU__STAGING.groups g 
LEFT JOIN MLDELENDIKYANDEXRU__STAGING.users AS u 
ON g.admin_id = u.id
WHERE u.id IS NULL)
UNION ALL
(SELECT COUNT(1), 'missing sender info'
FROM MLDELENDIKYANDEXRU__STAGING.dialogs d 
LEFT JOIN MLDELENDIKYANDEXRU__STAGING.users AS u 
ON d.message_from = u.id
WHERE u.id IS NULL)
UNION ALL
(SELECT COUNT(1), 'missing receiver info'
FROM MLDELENDIKYANDEXRU__STAGING.dialogs d
LEFT JOIN MLDELENDIKYANDEXRU__STAGING.users AS u 
ON d.message_to = u.id
WHERE u.id IS NULL)
UNION ALL 
(SELECT COUNT(1), 'norm receiver info'
FROM MLDELENDIKYANDEXRU__STAGING.dialogs d 
LEFT JOIN MLDELENDIKYANDEXRU__STAGING.users AS u 
ON d.message_from = u.id
WHERE u.id IS NOT NULL);
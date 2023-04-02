(SELECT count(1), 'missing group admin info' as info
FROM MLDELENDIK__STAGING.groups g 
LEFT JOIN MLDELENDIK__STAGING.users AS u 
ON g.admin_id = u.id
WHERE u.id IS NULL)
UNION ALL
(SELECT COUNT(1), 'missing sender info'
FROM MLDELENDIK__STAGING.dialogs d 
LEFT JOIN MLDELENDIK__STAGING.users AS u 
ON d.message_from = u.id
WHERE u.id IS NULL)
UNION ALL
(SELECT COUNT(1), 'missing receiver info'
FROM MLDELENDIK__STAGING.dialogs d
LEFT JOIN MLDELENDIK__STAGING.users AS u 
ON d.message_to = u.id
WHERE u.id IS NULL)
UNION ALL 
(SELECT COUNT(1), 'norm receiver info'
FROM MLDELENDIK__STAGING.dialogs d 
LEFT JOIN MLDELENDIK__STAGING.users AS u 
ON d.message_from = u.id
WHERE u.id IS NOT NULL);
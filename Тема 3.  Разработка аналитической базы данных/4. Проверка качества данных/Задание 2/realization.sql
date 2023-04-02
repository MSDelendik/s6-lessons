SELECT count(id) AS total, count(DISTINCT id) AS uniq, 'users' AS dataset
FROM MLDELENDIK__STAGING.users
UNION ALL
SELECT count(id) AS total, count(DISTINCT id) AS uniq, 'groups' AS dataset
FROM MLDELENDIK__STAGING.groups
UNION ALL
SELECT count(message_id) AS total, count(DISTINCT message_id) AS uniq, 'dialogs' AS dataset
FROM MLDELENDIK__STAGING.dialogs;
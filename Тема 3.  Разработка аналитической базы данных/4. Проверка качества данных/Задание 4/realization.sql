(SELECT 
    min(u.registration_dt) as datestamp,
    'earliest user registration' as info
FROM MLDELENDIK__STAGING.users u)
UNION ALL
(SELECT
    max(u.registration_dt),
    'latest user registration'
FROM MLDELENDIK__STAGING.users u)
UNION ALL
(SELECT 
    min(u.registration_dt) as datestamp,
    'earliest group creation' as info
FROM MLDELENDIK__STAGING.groups u)
UNION ALL
(SELECT
    max(u.registration_dt),
    'latest group creation'
FROM MLDELENDIK__STAGING.groups u)
UNION ALL
(SELECT 
    min(u.message_ts) as datestamp,
    'earliest dialog message' as info
FROM MLDELENDIK__STAGING.dialogs u)
UNION ALL
(SELECT
    max(u.message_ts),
    'latest dialog message'
FROM MLDELENDIK__STAGING.dialogs u);
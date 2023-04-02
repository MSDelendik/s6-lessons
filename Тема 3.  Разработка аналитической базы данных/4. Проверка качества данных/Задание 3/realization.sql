SELECT COUNT(hash(group_name)), COUNT(DISTINCT hash(group_name))
FROM MLDELENDIK__STAGING.groups;
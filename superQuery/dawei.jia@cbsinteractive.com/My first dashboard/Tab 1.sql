select distinct cbs_reg_user_id_cd, subscription_platform_cd 
from `i-dss-ent-data.ent_vw.subscription_fct` 
where expiration_dt is NULL or expiration_dt >= CURRENT_DATE() and subscription_platform_cd = 'ROKU'
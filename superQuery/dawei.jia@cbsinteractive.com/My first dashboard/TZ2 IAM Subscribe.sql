select cbs_reg_user_id_cd, activation_dt
from `i-dss-ent-data.ent_vw.subscription_fct`
where cbs_reg_user_id_cd in (SELECT distinct regid FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_WB_Control`) and activation_dt >= "2020-06-26" and activation_dt <= "2020-07-01"
order by 1,2
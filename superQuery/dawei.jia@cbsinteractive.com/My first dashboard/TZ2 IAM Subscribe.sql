select "WB_Control", (SELECT count(distinct regid) FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_WB_Control`) as count, count(distinct cbs_reg_user_id_cd) as subscribe
from `i-dss-ent-data.ent_vw.subscription_fct`
where cbs_reg_user_id_cd in (SELECT distinct regid FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_WB_Control`) and activation_dt >= "2020-06-26" and activation_dt <= "2020-07-01"
order by 1,2
union all
select "WB_Test", (SELECT count(distinct regid) FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_WB_Test`) as count, count(distinct cbs_reg_user_id_cd) as subscribe
from `i-dss-ent-data.ent_vw.subscription_fct`
where cbs_reg_user_id_cd in (SELECT distinct regid FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_WB_Test`) and activation_dt >= "2020-06-26" and activation_dt <= "2020-07-01"
order by 1,2
select "Acq_Control", (SELECT count(distinct regid) FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_Acq_Control`) as count, count(distinct cbs_reg_user_id_cd) as subscribe
from `i-dss-ent-data.ent_vw.subscription_fct`
where cbs_reg_user_id_cd in (SELECT distinct regid FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_Acq_Control`) and activation_dt >= "2020-06-26" and activation_dt <= "2020-07-01"
order by 1,2
union all
select "Acq_Test", (SELECT count(distinct regid) FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_Acq_Test`) as count, count(distinct cbs_reg_user_id_cd) as subscribe
from `i-dss-ent-data.ent_vw.subscription_fct`
where cbs_reg_user_id_cd in (SELECT distinct regid FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_Acq_Test`) and activation_dt >= "2020-06-26" and activation_dt <= "2020-07-01"
order by 1,2
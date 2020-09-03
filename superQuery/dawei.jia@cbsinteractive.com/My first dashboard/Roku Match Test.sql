with roku_viewer as (
select *, roku_minutes/minutes as roku_percent
from (
select v69_registration_id_nbr, SUM(duration_sec_qty/60) as minutes, 
       SUM(case when LOWER(v1_brand_nm) like '%roku%' then duration_sec_qty/60 else 0 end) as roku_minutes
from `i-dss-ent-data.dw_vw.aa_cs_video_detail_day`
where day_dt between '2019-09-01' and '2020-09-01' and v9_rsid in ('cnetcbscomsite','cbsicbsott','cbsicbsapp')
group by 1)
where minutes > 0 
      and roku_minutes/minutes >= 0.5),
      
active as (
select distinct cbs_reg_user_id_cd, subscription_platform_cd 
from `i-dss-ent-data.ent_vw.subscription_fct` 
where expiration_dt is NULL or expiration_dt >= CURRENT_DATE()),

signup_from_roku as (
select distinct cbs_reg_user_id_cd 
from `i-dss-ent-data.ent_vw.subscription_fct` 
where subscription_platform_cd = "ROKU"),

ex_roku_viewer as (
select distinct v69_registration_id_nbr 
from roku_viewer a left join active b on a.v69_registration_id_nbr=b.cbs_reg_user_id_cd
where cbs_reg_user_id_cd is null)

select distinct v69_registration_id_nbr, cbs_reg_user_id_cd 
from ex_roku_viewer a left join signup_from_roku b on a.v69_registration_id_nbr=b.cbs_reg_user_id_cd
where cbs_reg_user_id_cd is null
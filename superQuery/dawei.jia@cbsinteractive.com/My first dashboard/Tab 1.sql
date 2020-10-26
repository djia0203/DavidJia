with stage1 as (
select case when post_multi_value_var3_desc like "%recommended_related_shows_firetv:recommended_related_shows%" then "Test" 
            when post_multi_value_var3_desc like "%recommended_related_shows_firetv:control%" then "Control" else "Other" end as segment,
       post_evar1_desc,     
       user
from (
select distinct post_multi_value_var3_desc, post_evar1_desc,
                case when post_multi_value_var3_desc like "%recommended_related_shows_firetv:control%" and 
                          post_multi_value_var3_desc like "%recommended_related_shows_firetv:recommended_related_shows%" then 1 else 0 end as if_pollution,
                post_visitor_id user
from `dw_vw.omniture_event_cdm_cnetcbscomsite` 
where day_dt between '2020-09-23' and '2020-10-25' 
      and post_multi_value_var3_desc like "%related_shows%" 
      and post_evar1_desc in ("cbscom_ott_androidtv","cbscom_ott_firetv")
) 
where if_pollution = 0)

select segment, count(distinct visit_session_id) as size, sum(minutes)/count(distinct visit_session_id) as min_per_session,
       stddev(minutes) as std_min
from (
select b.visit_session_id, user, v69_registration_id_nbr, segment, sum(b.video_total_time_sec_qty/60) as minutes
from stage1 join `i-dss-ent-data.dw_vw.aa_video_detail_reporting_day` b on stage1.user = b.post_visitor_id 
where day_dt between '2020-09-23' and '2020-10-25' 
      and video_full_episode_ind = true
      and lower(b.v38_video_content_type_cd) not like "%live%"
      and report_suite_id_nm = "cnetcbscomsite"
      and v1_brand_platform_nm = "cbscom_ott_firetv"
group by 1,2,3,4)
where v69_registration_id_nbr not in (select distinct cbs_reg_user_id_cd from `i-dss-ent-data.ent_vw.subscription_fct` where activation_dt >= '2020-09-23')
group by 1
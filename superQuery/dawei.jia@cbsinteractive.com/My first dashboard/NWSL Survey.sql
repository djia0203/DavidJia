select FEP, COUNT(distinct regid) as count from (
select v69_registration_id_nbr as regid, COUNT(distinct video_title) as FEP
from `i-dss-ent-data.dw_vw.aa_cs_video_detail_day` cs join `i-dss-ent-data.dw_vw.mpx_video_content` mpx on cs.v31_mpx_reference_guid=mpx.mpx_reference_guid
where video_full_episode_ind = TRUE 
    and video_show_nm = "National Women's Soccer League"
    and v69_registration_id_nbr is not null
    and v9_rsid IN ('cnetcbscomsite','cbsicbsapp', 'cbsicbsott')
    and day_dt >= "2020-06-27"
    and duration_sec_qty/60 >= 30
group by 1)
group by 1
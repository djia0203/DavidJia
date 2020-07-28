select v69_registration_id_nbr, count(distinct video_episode_nbr) as FEP FROM (
select *, case when ((case when a.duration_sec_qty <= 0 then .0001 else a.duration_sec_qty end)/
              nullif(b.length_in_seconds, 0)) >=1
        then 1
        else safe_cast(((case when a.duration_sec_qty <= 0 then .0001 else a.duration_sec_qty end)/
                nullif(b.length_in_seconds, 0)) as float64) end as comp_pct
from `i-dss-ent-data.dw_vw.aa_cs_video_detail_day` a join `i-dss-ent-data.dw_vw.mpx_video_content` b on a.v31_mpx_reference_guid=b.mpx_reference_guid
where video_show_nm = "The Twilight Zone" and video_season_nbr = "2" and video_full_episode_ind = true and day_dt >= "2020-06-26" and day_dt <= "2020-07-01"
      and v69_registration_id_nbr is not null and v69_registration_id_nbr in (SELECT distinct regid FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_WB_Control`))
WHERE comp_pct >= 0.95
group by 1
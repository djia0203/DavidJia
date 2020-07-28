select "WB_Control", (SELECT count(distinct regid) FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_WB_Control`) as count, COUNT(distinct v69_registration_id_nbr) as streams, SUM(duration_sec_qty)/60 as minutes, STDDEV(duration_sec_qty/60) as minutes_std,
     COUNT(distinct case when comp_pct >= 0.95 and video_episode_nbr = "1" then v69_registration_id_nbr end) as finish_ep1
from (select *, case when ((case when cs.duration_sec_qty <= 0 then .0001 else cs.duration_sec_qty end)/
              nullif(mpx.length_in_seconds, 0)) >=1
        then 1
        else safe_cast(((case when cs.duration_sec_qty <= 0 then .0001 else cs.duration_sec_qty end)/
                nullif(mpx.length_in_seconds, 0)) as float64) end as comp_pct
                from `i-dss-ent-data.dw_vw.aa_cs_video_detail_day` a join `i-dss-ent-data.dw_vw.mpx_video_content` b on a.v31_mpx_reference_guid=b.mpx_reference_guid)
where video_show_nm = "The Twilight Zone" and video_season_nbr = "2" and video_full_episode_ind = true and day_dt >= "2020-06-26" and day_dt <= "2020-07-01"
      and v69_registration_id_nbr is not null and v69_registration_id_nbr in (SELECT distinct regid FROM `i-dss-ent-data.temp_dj.TZS2_Sampling_WB_Control`)
group by 1
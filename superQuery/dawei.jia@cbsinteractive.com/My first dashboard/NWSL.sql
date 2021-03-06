select source_desc, content_type_cd,-- episode_nm, 
       SUM(duration_min_cnt) as minute, SUM(streams_cnt) as streams
from `i-dss-ent-data.ent_vw.multi_channels_summary_day`
where day_dt between '2020-06-27' and '2020-07-27' and (episode_nm like "Match Replay%" or episode_nm like "NWSL%") and site_country_cd = 'CA'
      and video_full_episode_ind = true
group by 1,2--,3
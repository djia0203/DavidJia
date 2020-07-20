select video_series_nm, episode_nm, video_full_episode_ind, SUM(duration_min_cnt) as minute, SUM(streams_cnt) as streams
from `i-dss-ent-data.ent_vw.multi_channels_summary_day`
where day_dt between '2020-06-27' and '2020-07-14' and site_country_cd = 'US'and source_desc = "Amazon Channels" and content_type_cd = 'LIVE'and video_series_nm = 'cbsnwsl'
group by 1,2,3
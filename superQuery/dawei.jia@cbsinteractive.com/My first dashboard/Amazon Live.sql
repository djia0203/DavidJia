select video_series_nm, content_type_cd, SUM(duration_min_cnt) as minute, SUM(streams_cnt) as streams
from `i-dss-ent-data.ent_vw.multi_channels_summary_day`
where day_dt between '2020-06-27' and '2020-07-23' and site_country_cd = 'US' and source_desc = "Amazon Channels" and video_series_nm = 'cbsnwsl'
group by 1,2
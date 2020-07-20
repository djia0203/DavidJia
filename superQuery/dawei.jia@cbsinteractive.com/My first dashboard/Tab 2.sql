select distinct video_series_nm, video_title, video_episode_nbr
from `i-dss-ent-data.dw_vw.mpx_video_content`
where (video_title like 'Match Replay%' or video_title like 'NWSL%') and video_series_nm = 'National Women's Soccer League' and video_full_episode_ind = true
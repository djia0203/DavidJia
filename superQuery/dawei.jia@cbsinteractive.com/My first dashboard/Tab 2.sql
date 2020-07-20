select distinct video_series_nm, video_title, video_episode_nbr
from `i-dss-ent-data.dw_vw.mpx_video_content`
where video_title like 'Match Replay%' and video_full_episode_ind = true
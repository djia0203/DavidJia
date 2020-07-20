select distinct video_series_nm
from `i-dss-ent-data.dw_vw.mpx_video_content`
where day_dt >= '2020-06-27' and video_title like 'Match Replay%'
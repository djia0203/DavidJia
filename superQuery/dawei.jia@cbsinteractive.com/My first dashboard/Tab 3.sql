select reg_cookie, att_level_up1, service
from `i-dss-ent-data.ent_summary.att_20160201_present`
where start_dt >= "2020-06-27" and start_dt <= "2020-07-27" and att_level_up1 = "NWSL" and service not in ("Trial","Trial to Paid")
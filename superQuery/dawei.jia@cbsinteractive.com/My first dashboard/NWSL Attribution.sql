select att_level_up1, att_gp, count(distinct reg_cookie) as count from (
select reg_cookie, service, att_level_up1, att_gp
from `i-dss-ent-data.ent_summary.att_20160201_present`
where reg_cookie in (
select distinct reg_cookie
from `i-dss-ent-data.ent_summary.att_20160201_present`
where start_dt >= "2020-06-27" and start_dt <= "2020-07-27" and att_level_up1 = "NWSL" and service not in ("Trial","Trial to Paid")) and start_dt < "2020-06-27")
group by 1,2
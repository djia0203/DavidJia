select
b.age
count(distinct a.reg_cookie) as users
from
`i-dss-ent-data.ent_summary.att_20160201_present` a
join
(select reg_cookie,age,gender,signup_device,signup_device_platform from `i-dss-ent-data.ent_summary.al_sub_all`) b
on a.reg_cookie = b.reg_cookie
where
start_dt >= "2020-06-27" and start_dt <= "2020-07-27"
and att_level_up1 = "NWSL"
group by 1
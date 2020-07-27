select
case
when b.age < 18 then "18-"
when b.age >= 18 and b.age <= 24 then "18-24"
when b.age >= 25 and b.age <= 34 then "25-34"
when b.age >= 35 and b.age <= 44 then "35-44"
when b.age >= 45 and b.age <= 54 then "45-54"
when b.age >= 55 and b.age <= 64 then "55-64"
when b.age >= 65 then "65+"
else null end as age
,
b.gender, 
--a.platform, 
--a.signup_device,
count(distinct a.reg_cookie) as users
from
`i-dss-ent-data.ent_summary.att_20160201_present` a
join
(select reg_cookie,age,gender,signup_device,signup_device_platform from `i-dss-ent-data.ent_summary.al_sub_all`) b
on a.reg_cookie = b.reg_cookie
where
start_dt >= "2020-06-27" and start_dt <= "2020-07-27"
and att_level_up1 = "NWSL"
group by 1,2
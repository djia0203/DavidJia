SELECT day_dt, replace(ftag,"ftag:","") as ftag, count(distinct visit_session_id) as visits
FROM  `i-dss-ent-data.dw_vw.omniture_event_cdm_cnetcbscomsite`, UNNEST(post_campaign_nm) as ftag 
WHERE  day_dt = '2020-06-01'
and ftag like  '%AAM%'
group by 1,2
order by 1,3 desc
SELECT day_dt, replace(ftag,"ftag:","") as ftag, count(distinct visit_session_id) as visits, count(distinct post_visitor_id) as devices,
       COUNT(distinct case when post_evar10_desc = "svod_complete" or post_evar10_desc = "billing|payment complete" then post_visitor_id end) as orders,
       COUNT(case when `post_event_id_list_desc.id` like "%52%" then post_visitor_id end) as streams
FROM  `i-dss-ent-data.dw_vw.omniture_event_cdm_cnetcbscomsite`, UNNEST(post_campaign_nm) as ftag 
WHERE  day_dt = '2020-06-01'
and ftag like  '%AAM%'
group by 1,2
order by 1,3 desc
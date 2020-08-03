SELECT day_dt, replace(ftag,"ftag:","") as ftag, count(distinct visit_session_id) as visits, count(distinct post_visitor_id) as devices,
       COUNT(distinct case when post_evar10_desc = "svod_complete" or post_evar10_desc = "billing|payment complete" then post_visitor_id end) as orders,
       sum(case when exists (select * from unnest(post_event_id_list_desc) as x where x.name = 'Custom Event 52') then 1 else 0 end) as streams
FROM  `i-dss-ent-data.dw_vw.omniture_event_cdm_cnetcbscomsite`, UNNEST(post_campaign_nm) as ftag
WHERE  day_dt >= '2020-07-30' and day_dt <= "2020-07-31"
and ftag like  '%AAM%'
group by 1,2
order by 1,3 desc
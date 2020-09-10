SELECT day_dt, visit_session_id, post_visitor_id, replace(ftag,"ftag:","") as ftag, 
       sum(case when exists (select * from unnest(post_event_id_list_desc) as x where x.name = 'Custom Event 76') then 1 else 0 end) as starts,
       sum(case when exists (select * from unnest(post_event_id_list_desc) as x where x.name = 'Custom Event 52') then 1 else 0 end) as streams
FROM  `i-dss-ent-data.dw_vw.omniture_event_cdm_cnetcbscomsite`, UNNEST(post_campaign_nm) as ftag
WHERE  day_dt >= "2020-07-30" and day_dt <= '2020-08-31' 
      -- and ftag in (SELECT distinct ftag FROM `i-dss-ent-data.temp_dj.Super_service_ftag` WHERE F3 = "BET")
      and ftag like "AAM-00-10ajc%"
group by 1,2,3,4
order by 1,2,3,4 desc
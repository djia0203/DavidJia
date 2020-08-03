select distinct CASE when post_evar69_desc IS NULL then post_visitor_id else post_evar69_desc end user,
       case when post_multi_value_var3_desc like "%collapsed_upsell_web:collapsed%" and post_multi_value_var3_desc not like "%collapsed_upsell_web:anchor%" 
                 and post_multi_value_var3_desc not like "%collapsed_upsell_web:control%" then "collapsed"
            when post_multi_value_var3_desc like "%collapsed_upsell_web:anchor%" and post_multi_value_var3_desc not like "%collapsed_upsell_web:collapsed%" 
                 and post_multi_value_var3_desc not like "%collapsed_upsell_web:control%" then "anchor"
            when post_multi_value_var3_desc like "%collapsed_upsell_web:control%" and post_multi_value_var3_desc not like "%collapsed_upsell_web:anchor%" 
                 and post_multi_value_var3_desc not like "%collapsed_upsell_web:collapsed%" then "control" 
            else "pollution" end as segment,
       post_evar19_desc
from `i-dss-ent-data.dw_vw.omniture_event_cdm_cnetcbscomsite` a join `i-dss-ent-data.ent_vw.subscription_fct` b on a.post_evar69_desc = b.cbs_reg_user_id_cd
where day_dt between '2020-07-15' and '2020-07-22' and post_multi_value_var3_desc like "%collapsed_upsell%" and a.post_evar1_desc like "cbscom_site%"
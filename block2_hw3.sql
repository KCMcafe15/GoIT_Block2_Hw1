with all_ads_data as(
select 
	fabd.ad_date, 
	fc.campaign_name, 
	fa.adset_name,
	fabd.spend,
	fabd.impressions,
	fabd.reach,
	fabd.clicks,
	fabd.leads,
	fabd.value
from facebook_ads_basic_daily fabd
left join facebook_adset fa on fa.adset_id = fabd.adset_id
left join facebook_campaign fc on fc.campaign_id = fabd.campaign_id

union all

select
	ad_date, 
	campaign_name, 
	adset_name,
	spend,
	impressions,
	reach,
	clicks,
	leads,
	value
from google_ads_basic_daily gabd
)

select
	ad_date,
	campaign_name,
	sum(spend) as total_spend,
	sum(impressions) as total_impressions,
	sum(clicks) as total_clicks,
	sum(value) as total_value
from all_ads_data aad
group by ad_date, campaign_name
order by ad_date desc;
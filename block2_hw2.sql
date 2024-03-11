select
	ad_date,
	campaign_id,
	sum(spend) as total_spend,
	sum(impressions) as total_impressions,
	sum(clicks) as total_clicks,
	sum(value) as total_value,
	sum(spend)/sum(clicks) as cpc,
	1000*sum(spend)/sum(impressions) as cpm,
	sum(clicks)::numeric/sum(impressions) as ctr,
	sum(value)::numeric/sum(spend) as romi
from facebook_ads_basic_daily fabd
where clicks > 0 and impressions > 0 and spend > 0
group by ad_date, campaign_id  
order by ad_date desc;
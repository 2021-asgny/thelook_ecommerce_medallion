CREATE OR REPLACE TABLE `my-project-0526-502020.Look_Ticaret_Gold.dim_marketing_channels` AS
WITH all_sources AS (
  SELECT traffic_source FROM `my-project-0526-502020.Look_Ticaret.users` WHERE traffic_source IS NOT NULL
  UNION DISTINCT
  SELECT traffic_source FROM `my-project-0526-502020.Look_Ticaret.stg_events` WHERE traffic_source IS NOT NULL
)
SELECT DISTINCT
  traffic_source AS channel_id,
  INITCAP(traffic_source) AS channel_name,
  CASE 
    WHEN LOWER(traffic_source) IN ('search', 'organic') THEN 'Organic'
    WHEN LOWER(traffic_source) IN ('adwords', 'display', 'facebook') THEN 'Paid'
    WHEN LOWER(traffic_source) = 'email' THEN 'Owned'
    ELSE 'Other'
  END AS channel_group
FROM all_sources;
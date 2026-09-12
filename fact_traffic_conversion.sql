CREATE OR REPLACE TABLE `my-project-0526-502020.Look_Ticaret_Gold.fact_traffic_conversion` AS
SELECT
  traffic_source,
  COUNT(DISTINCT session_id) AS total_sessions,
  COUNT(DISTINCT user_id) AS total_unique_users,
  SUM(is_cart_add) AS total_cart_additions,
  SUM(is_purchase) AS total_purchases,
  ROUND((SUM(is_cart_add) * 100.0) / NULLIF(COUNT(DISTINCT session_id), 0), 2) AS cart_addition_rate_pct,
  ROUND((SUM(is_purchase) * 100.0) / NULLIF(COUNT(DISTINCT session_id), 0), 2) AS conversion_rate_pct
FROM `my-project-0526-502020.Look_Ticaret.stg_events`
GROUP BY traffic_source
ORDER BY total_sessions DESC;
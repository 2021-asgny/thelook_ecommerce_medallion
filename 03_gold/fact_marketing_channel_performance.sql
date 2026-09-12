CREATE OR REPLACE TABLE `my-project-0526-502020.Look_Ticaret_Gold.fact_marketing_channel_performance` AS
WITH session_channels AS (
  SELECT
    session_id,
    traffic_source,
    MAX(is_cart_add) AS added_to_cart,
    MAX(is_purchase) AS purchased
  FROM `my-project-0526-502020.Look_Ticaret.stg_events`
  GROUP BY session_id, traffic_source
),
channel_aggregates AS (
  SELECT
    traffic_source,
    COUNT(session_id) AS total_sessions,
    COUNTIF(added_to_cart = 1) AS cart_sessions,
    COUNTIF(purchased = 1) AS purchase_sessions
  FROM session_channels
  GROUP BY traffic_source
)
SELECT
  traffic_source,
  total_sessions,
  cart_sessions,
  purchase_sessions,
  ROUND((total_sessions * 100.0) / SUM(total_sessions) OVER(), 2) AS session_share_pct,
  ROUND((cart_sessions * 100.0) / NULLIF(total_sessions, 0), 2) AS cart_rate_pct,
  ROUND((purchase_sessions * 100.0) / NULLIF(total_sessions, 0), 2) AS purchase_cvr_pct
FROM channel_aggregates
ORDER BY total_sessions DESC;
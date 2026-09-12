CREATE OR REPLACE TABLE `my-project-0526-502020.Look_Ticaret_Gold.fact_funnel_dropoff` AS
WITH session_steps AS (
  SELECT
    event_date,
    traffic_source AS channel_name,
    session_id,
    MAX(is_product_view) AS visited_product,
    MAX(is_cart_add) AS added_to_cart,
    MAX(is_purchase) AS purchased
  FROM `my-project-0526-502020.Look_Ticaret.stg_events`
  GROUP BY event_date, traffic_source,event_id, session_id
)
SELECT
  event_date,
  channel_name, 
  COUNT(session_id) AS total_sessions,
  COUNTIF(visited_product = 1) AS product_view_sessions,
  COUNTIF(added_to_cart = 1) AS cart_add_sessions,
  COUNTIF(purchased = 1) AS purchase_sessions,
  
  ROUND(COUNTIF(visited_product = 1) * 100.0 / COUNT(session_id), 2) AS home_to_product_rate_pct,
  ROUND(COUNTIF(added_to_cart = 1) * 100.0 / NULLIF(COUNTIF(visited_product = 1), 0), 2) AS product_to_cart_rate_pct,
  ROUND(COUNTIF(purchased = 1) * 100.0 / NULLIF(COUNTIF(added_to_cart = 1), 0), 2) AS cart_to_purchase_rate_pct
FROM session_steps
GROUP BY event_date, channel_name;

CREATE OR REPLACE TABLE `my-project-0526-502020.Look_Ticaret_Gold.fact_user_engagement_conversion` AS
WITH session_metrics AS (
  SELECT
    session_id,
    user_id,
    COUNT(event_id) AS total_events,
    SUM(is_product_view) AS product_views,
    SUM(is_cart_add) AS cart_views,
    MAX(is_purchase) AS has_purchased
  FROM `my-project-0526-502020.Look_Ticaret.stg_events`
  GROUP BY session_id, user_id
)
SELECT
  CASE WHEN has_purchased = 1 THEN 'Satın Alım Yapan' ELSE 'Satın Alım Yapmayan' END AS user_group,
  COUNT(DISTINCT session_id) AS total_sessions,
  ROUND(AVG(total_events), 2) AS avg_events_per_session,
  ROUND(AVG(product_views), 2) AS avg_product_views_per_session,
  ROUND(AVG(cart_views), 2) AS avg_cart_views_per_session
FROM session_metrics
GROUP BY 1;
CREATE OR REPLACE VIEW `my-project-0526-502020.Look_Ticaret.stg_events` AS
SELECT
  id AS event_id,
  user_id,
  session_id,
  sequence_number,

  COALESCE(ip_address, 'Unknown') AS ip_address,
  COALESCE(city, 'Unknown') AS city,
  COALESCE(state, 'Unknown') AS state,
  COALESCE(postal_code, 'Unknown') AS postal_code,
  COALESCE(browser, 'Unknown') AS browser,
  COALESCE(traffic_source, 'Unknown') AS traffic_source,

  LOWER(TRIM(event_type)) AS event_type,
  uri,
  created_at AS event_timestamp,
  DATE(created_at) AS event_date,
  EXTRACT(HOUR FROM created_at) AS event_hour,
  FORMAT_DATE('%A', DATE(created_at)) AS event_day_name,

  CASE WHEN LOWER(TRIM(event_type)) = 'home' THEN 1 ELSE 0 END AS is_home_view,
  CASE WHEN LOWER(TRIM(event_type)) = 'department' THEN 1 ELSE 0 END AS is_department_view,
  CASE WHEN LOWER(TRIM(event_type)) = 'product' THEN 1 ELSE 0 END AS is_product_view,
  CASE WHEN LOWER(TRIM(event_type)) = 'cart' THEN 1 ELSE 0 END AS is_cart_add,
  CASE WHEN LOWER(TRIM(event_type)) = 'purchase' THEN 1 ELSE 0 END AS is_purchase,
  CASE WHEN LOWER(TRIM(event_type)) = 'cancel' THEN 1 ELSE 0 END AS is_cancel

FROM `my-project-0526-502020.Look_Ticaret.events_native`; 
CREATE OR REPLACE VIEW `my-project-0526-502020.Look_Ticaret.stg_orders` AS
SELECT
  order_id,
  user_id,
  LOWER(TRIM(status)) AS order_status,
  LOWER(TRIM(gender)) AS gender,
  created_at AS order_timestamp,
  DATE(created_at) AS order_date,
  EXTRACT(HOUR FROM created_at) AS order_hour,
  FORMAT_DATE('%A', DATE(created_at)) AS order_day_name,
  COALESCE(num_of_item, 0) AS total_items_in_order,
  shipped_at,
  delivered_at,
  returned_at
FROM `my-project-0526-502020.Look_Ticaret.orders`;
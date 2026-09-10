CREATE OR REPLACE VIEW `my-project-0526-502020.Look_Ticaret.stg_order_items` AS
SELECT
  id AS order_item_id,
  order_id,
  user_id,
  product_id,
  inventory_item_id,
  LOWER(TRIM(status)) AS item_status,
  created_at AS item_created_timestamp,
  DATE(created_at) AS item_created_date,
  EXTRACT(HOUR FROM created_at) AS item_created_hour,
  FORMAT_DATE('%A', DATE(created_at)) AS item_created_day_name,
  ROUND(CAST(sale_price AS NUMERIC), 2) AS sale_price,
  shipped_at,
  delivered_at,
  returned_at
FROM `my-project-0526-502020.Look_Ticaret.orders_items`;
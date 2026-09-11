CREATE OR REPLACE TABLE `my-project-0526-502020.Look_Ticaret_Gold.fact_order_financials` AS
SELECT
  order_id,
  user_id,
  COUNT(order_item_id) AS total_items,
  ROUND(SUM(sale_price), 2) AS order_revenue
FROM `my-project-0526-502020.Look_Ticaret.stg_order_items`
WHERE item_status NOT IN ('Cancelled', 'Returned')
GROUP BY order_id, user_id;
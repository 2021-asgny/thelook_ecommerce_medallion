CREATE OR REPLACE TABLE `my-project-0526-502020.Look_Ticaret_Gold.dim_products` AS
SELECT
  product_id,
  product_name,
  category,
  brand,
  department,
  cost,
  retail_price,
  ROUND(retail_price - cost, 2) AS profit_margin
FROM `my-project-0526-502020.Look_Ticaret.stg_products`;
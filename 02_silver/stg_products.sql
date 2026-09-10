CREATE OR REPLACE VIEW `my-project-0526-502020.Look_Ticaret.stg_products` AS
SELECT
  id AS product_id,
  COALESCE(LOWER(TRIM(name)), 'Unknown') AS product_name,
  COALESCE(LOWER(TRIM(category)), 'Unknown') AS category,
  COALESCE(LOWER(TRIM(brand)), 'Unknown') AS brand,
  COALESCE(LOWER(TRIM(department)), 'Unknown') AS department,
  COALESCE(LOWER(TRIM(sku)), 'Unknown') AS sku,
  ROUND(CAST(cost AS NUMERIC), 2) AS cost,
  ROUND(CAST(retail_price AS NUMERIC), 2) AS retail_price,
  distribution_center_id
FROM `my-project-0526-502020.Look_Ticaret.products`;
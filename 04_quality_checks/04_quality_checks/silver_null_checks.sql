
SELECT 'stg_orders' AS tablo_adi,
       COUNTIF(order_status IS NULL) AS null_status,
       COUNTIF(gender IS NULL) AS null_gender,
       0 AS null_product_name
FROM `my-project-0526-502020.Look_Ticaret.stg_orders`

UNION ALL

SELECT 'stg_order_items' AS tablo_adi,
       COUNTIF(item_status IS NULL) AS null_status,
       0 AS null_gender,
       0 AS null_product_name
FROM `my-project-0526-502020.Look_Ticaret.stg_order_items`

UNION ALL

SELECT 'stg_products' AS tablo_adi,
       0 AS null_status,
       0 AS null_gender,
       COUNTIF(product_name IS NULL OR product_name = '') AS null_product_name
FROM `my-project-0526-502020.Look_Ticaret.stg_products`; 


SELECT 
  COUNTIF(user_id IS NULL) AS null_user_id,
  COUNTIF(session_id IS NULL OR session_id = '') AS null_veya_bos_session,
  COUNTIF(event_type IS NULL OR event_type = '') AS null_veya_bos_event_type,
  COUNTIF(city = 'Unknown') AS bilinmeyen_sehir_sayisi
FROM `my-project-0526-502020.Look_Ticaret.stg_events`;
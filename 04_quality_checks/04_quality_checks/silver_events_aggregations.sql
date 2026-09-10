
SELECT
  COUNT(*) AS toplam_satir_sayisi,
  COUNT(DISTINCT session_id) AS toplam_tekil_oturum,
  
  SUM(is_home_view) AS home_sayisi,
  SUM(is_department_view) AS department_sayisi,
  SUM(is_product_view) AS product_sayisi,
  SUM(is_cart_add) AS cart_sayisi,
  SUM(is_purchase) AS purchase_sayisi,
  SUM(is_cancel) AS cancel_sayisi,

  COUNTIF(ip_address = 'Unknown') AS bilinmeyen_ip_sayisi,
  COUNTIF(city = 'Unknown') AS bilinmeyen_sehir_sayisi
FROM `my-project-0526-502020.Look_Ticaret.stg_events`;
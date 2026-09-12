CREATE OR REPLACE TABLE `my-project-0526-502020.Look_Ticaret_Gold.dim_date` AS
SELECT
  date_day AS date,
  EXTRACT(YEAR FROM date_day) AS year,
  EXTRACT(MONTH FROM date_day) AS month,
  FORMAT_DATE('%B', date_day) AS month_name,
  EXTRACT(DAY FROM date_day) AS day,
  EXTRACT(DAYOFWEEK FROM date_day) AS day_of_week,
  FORMAT_DATE('%A', date_day) AS day_name,
  EXTRACT(QUARTER FROM date_day) AS quarter
FROM UNNEST(GENERATE_DATE_ARRAY('2019-01-01', '2026-12-31', INTERVAL 1 DAY)) AS date_day;
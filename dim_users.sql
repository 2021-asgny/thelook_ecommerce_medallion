CREATE OR REPLACE TABLE `my-project-0526-502020.Look_Ticaret_Gold.dim_users` AS
SELECT
  id AS user_id,
  age,
  gender,
  country,
  city,
  state,
  traffic_source AS acquisition_channel,
  created_at AS user_created_at
FROM `my-project-0526-502020.Look_Ticaret.users`;
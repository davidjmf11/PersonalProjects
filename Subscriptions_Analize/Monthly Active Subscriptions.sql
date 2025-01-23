-- Create a table to number of monthly active subscriptions 

create table subscription_sales.active_subscriptions as
WITH DateRange AS (     -- create a rangue of monthly dates since the first date till the actual date
  SELECT 
    DATE_ADD(DATE('2016-01-01'), INTERVAL n MONTH) AS month_start
  FROM 
    UNNEST(GENERATE_ARRAY(0, TIMESTAMP_DIFF(date('2024-12-12'), date('2016-01-01'), MONTH))) AS n
),
dateorganize as (     -- Organize the dates into the format needed 
  select 
  id,
  DATE(TIMESTAMP(created_at)) AS created_at,
  DATE(TIMESTAMP(canceled_at)) as canceled_at
  from `nexar-444414.subscription_sales.Subscription_sales`
),
ActiveSubscriptions AS (      -- finding the active subscriptions in every month 
  SELECT 
    DR.month_start,
    COUNT(DISTINCT S.id) AS active_subscriptions
  FROM 
    DateRange DR
  LEFT JOIN 
    dateorganize  S
  ON 
    S.created_at <= DR.month_start
    AND (S.canceled_at IS NULL OR S.canceled_at >= DR.month_start)
  GROUP BY 
    DR.month_start
)

SELECT 
  month_start,
  active_subscriptions
FROM 
  ActiveSubscriptions
ORDER BY 
  month_start;


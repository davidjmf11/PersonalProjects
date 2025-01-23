-- Checking Duplicates

SELECT
id
FROM `nexar-444414.subscription_sales.Subscription_sales`
group by id
HAVING COUNT(*) > 1;


-- Cheking Missing Data 

select * 
from `nexar-444414.subscription_sales.Subscription_sales`
where subtotal is null or created_at is null or id is null ; 



-- Analize subscriptions names 

select distinct plan.name, count(*) as Count
from `nexar-444414.subscription_sales.Subscription_sales`
group by plan.name;


-- Understand cases where the month total revenue = 0$

WITH GroupedData AS (
  SELECT 
    FORMAT_TIMESTAMP('%m/%Y', created_at) AS Date,
    SUM(subtotal) AS TotalSubtotal
  FROM 
    `nexar-444414.subscription_sales.Subscription_sales`
  GROUP BY 
    Date
  HAVING 
    TotalSubtotal = 0 
)
SELECT 
  FORMAT_TIMESTAMP('%m/%Y', created_at) AS Date,
  subtotal,
  plan.object,
  plan.id,
  id,
  plan.name,
  plan.code,
  unit_amount,
  quantity,
  expiration_reason,
  renewal_billing_cycles
FROM 
  `nexar-444414.subscription_sales.Subscription_sales`
WHERE 
  FORMAT_TIMESTAMP('%m/%Y', created_at) IN (
    SELECT Date FROM GroupedData
  )
ORDER BY 
  PARSE_TIMESTAMP('%m/%Y', Date);


-- Months where the mean of subtotal column was lower than 3$ and then look at that rows

  SELECT 
    FORMAT_TIMESTAMP('%m/%Y', created_at) AS Date,
    SUM(subtotal)/SUM(quantity) AS AVGSubtotal
  FROM 
    `nexar-444414.subscription_sales.Subscription_sales`
  GROUP BY 
    Date
  HAVING 
    AVGSubtotal < 3;


WITH GroupedData AS (
  SELECT 
    FORMAT_TIMESTAMP('%m/%Y', created_at) AS Date,
    AVG(subtotal) AS AVGSubtotal
  FROM 
    `nexar-444414.subscription_sales.Subscription_sales`
  GROUP BY 
    Date
  HAVING 
    AVGSubtotal < 3 
)
SELECT 
  FORMAT_TIMESTAMP('%m/%Y', created_at) AS Date,
  subtotal,
  plan.object,
  plan.id,
  id,
  plan.name,
  plan.code,
  unit_amount,
  quantity,
  expiration_reason,
  renewal_billing_cycles
FROM 
  `nexar-444414.subscription_sales.Subscription_sales`
WHERE 
  FORMAT_TIMESTAMP('%m/%Y', created_at) IN (
    SELECT Date FROM GroupedData
  )
ORDER BY 
  PARSE_TIMESTAMP('%m/%Y', Date);









-- monthly subscriptions sales table with columns Date, Total Revenue and Subscription Number
create table subscription_sales.monthly_subscritpions_sales as
SELECT
    FORMAT_TIMESTAMP('%m/%Y', created_at) AS Date, 
    Format('%.2f', SUM(subtotal)) AS total_revenue,                         
    Sum(quantity) AS subscription_number                     
FROM
    `nexar-444414.subscription_sales.Subscription_sales`                                            
     
GROUP BY
    Date         
ORDER BY
   PARSE_TIMESTAMP('%m/%Y', Date);





-- Subscriptions expired with cycles over a year 
SELECT plan.name, 
  count(*) as count_subscriptions,
  sum(quantity) sum_quantity,
  format('%.2f',AVG(total_billing_cycles)) as AVG_months_subscribed 
FROM `nexar-444414.subscription_sales.Subscription_sales` 
where state = 'expired' and total_billing_cycles >= 12
group by plan.name;


-- Plans that increased fee and number of subscription before and after
with plans_changed_fee_temp as (
select distinct plan.name as name, unit_amount
from `nexar-444414.subscription_sales.Subscription_sales`
),
 plans_changed_fee as (
select name
from plans_changed_fee_temp
group by name
having count(name) > 1
)

select distinct plan.name, unit_amount, SUM(quantity) as total_quantity
from `nexar-444414.subscription_sales.Subscription_sales`
where plan.name in ( select name from plans_changed_fee)
group by plan.name, unit_amount
order by plan.name, unit_amount
;

-- Cancelled subscription by Month

select 
format_timestamp('%m', canceled_at) as month_cancelation,
count(*) as number
from `nexar-444414.subscription_sales.Subscription_sales`
where canceled_at is not null
group by month_cancelation
order by month_cancelation;


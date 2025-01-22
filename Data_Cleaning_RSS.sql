-- Project in bigQuery 
-- Dataset https://www.kaggle.com/datasets/ahmedmohamed2003/retail-store-sales-dirty-for-data-cleaning

SELECT distinct *  FROM `david-448511.RSS.RSS` ; -- No Duplicates

Select distinct Location
from `david-448511.RSS.RSS`; -- 0 mistakes found

Select distinct `Payment Method`
from `david-448511.RSS.RSS`; -- 0 mistakes found

Select distinct Category
from `david-448511.RSS.RSS`; -- 0 mistakes found

select *
from `david-448511.RSS.RSS`
where Quantity is not null and `Total Spent` is null ; -- 0 Results

select *
from `david-448511.RSS.RSS`
where Quantity is null and `Total Spent` is not null ; -- 0 Results

select *
from `david-448511.RSS.RSS`
where `Price per Unit` is null and (Quantity is null or `Total Spent` is not null) ; -- 609 row without Price per Unit

-- Correct Data without Price per Unit

Update `david-448511.RSS.RSS`
set `Price Per Unit`= `Total Spent`/ Quantity 
where `Price Per Unit` is null ; 


-- Update the columns with Item = Null
-- It's possible to find the item by making the correlation between the same category and Price Per Item. Category + Price per Unit = Unique Key

--First create a table with the transaction ID with Item Null and fill it 

Create table `david-448511.RSS.ItemNullFilled` as 

with ItemNull as (
  select 
*
from `david-448511.RSS.RSS` 
Where Item is null), 

ItemNotNull as (
  select *
  from `david-448511.RSS.RSS` 
  where item is not null
)


Select distinct
ItemNull.`Transaction ID`,
ItemNull.Category,
case when ItemNull.Category = ItemNotNull.Category and ItemNull.`Price Per Unit`= ItemNotNull.`Price Per Unit` Then ItemNotNull.Item else '' end as Item,
ItemNull.`Price Per Unit`
from ItemNull
Left Join ItemNotNull on (ItemNull.Category = ItemNotNull.Category and ItemNull.`Price Per Unit`=ItemNotNull.`Price Per Unit`)
order by Item;

-- Make the update based on the table created 

Update `david-448511.RSS.RSS` t1
Set t1.Item = t2.Item
from `david-448511.RSS.ItemNullFilled` t2 
where t1.`Transaction ID` = t2.`Transaction ID` and t1.Item is null;





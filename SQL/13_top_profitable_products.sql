-- Identify the top 10 most profitable products

select
product_name,
category,
sub_category,
sum(sales) as total_sales,
sum(profit) as total_profit,
sum(quantity) as total_quantity_sold
from public.retail_sales
group by product_name, category, sub_category
order by total_profit desc
limit 10;
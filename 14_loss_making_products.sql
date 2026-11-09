-- Identify the 10 products generating the highest losses

select
product_name,
category,
sub_category,
sum(sales) as total_sales,
sum(profit) as total_profit,
sum(quantity) as total_quantity_sold
from public.retail_sales
group by product_name, category, sub_category
order by total_profit asc
limit 10;
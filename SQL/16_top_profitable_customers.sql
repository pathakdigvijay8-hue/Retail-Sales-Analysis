-- Identify the top 10 most profitable customers

select
customer_name,
segment,
count(distinct order_id) as total_orders,
sum(sales) as total_sales,
sum(profit) as total_profit
from public.retail_sales
group by customer_name, segment
order by total_profit desc
limit 10;
-- Analyse sales and profit by customer segment

select
segment,
count(distinct customer_id) as total_customers,
count(distinct order_id) as total_orders,
sum(sales) as total_sales,
sum(profit) as total_profit,
round((sum(profit) / nullif(sum(sales), 0)) * 100, 2) as profit_margin_percentage
from public.retail_sales
group by segment
order by total_sales desc;
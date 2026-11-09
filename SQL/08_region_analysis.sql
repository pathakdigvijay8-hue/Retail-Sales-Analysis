-- Analyse sales and profit by region

select
region,
sum(sales) as total_sales,
sum(profit) as total_profit,
count(distinct order_id) as total_orders,
round((sum(profit) / nullif(sum(sales), 0)) * 100, 2) as profit_margin_percentage
from public.retail_sales
group by region
order by total_sales desc;
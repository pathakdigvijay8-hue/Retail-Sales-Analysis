-- Analyse sales and profit by country

select
country,
count(distinct customer_id) as total_customers,
count(distinct order_id) as total_orders,
sum(sales) as total_sales,
sum(profit) as total_profit,
round((sum(profit) / nullif(sum(sales), 0)) * 100, 2) as profit_margin_percentage
from public.retail_sales
group by country
order by total_sales desc
limit 15;
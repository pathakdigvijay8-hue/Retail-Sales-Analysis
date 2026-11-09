-- Analyse sales and profit by shipping mode

select
ship_mode,
count(distinct order_id) as total_orders,
sum(sales) as total_sales,
sum(profit) as total_profit,
sum(shipping_cost) as total_shipping_cost,
round((sum(profit) / nullif(sum(sales), 0)) * 100, 2) as profit_margin_percentage
from retail_sales
group by ship_mode
order by total_sales desc;
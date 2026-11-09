-- Calculate overall business performance indicators
select
sum(sales) as total_sales,
sum(profit) as total_profit,
round((sum(profit) / nullif(sum(sales), 0)) * 100, 2) as profit_margin_percentage,
count(distinct order_id) as total_orders,
count(distinct customer_id) as total_customers,
count(distinct product_id) as unique_products,
sum(quantity) as total_quantity_sold
from retail_sales;
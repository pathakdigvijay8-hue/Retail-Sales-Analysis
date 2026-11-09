-- Analyse monthly sales and profit trends

select
extract(year from order_date) as sales_year,
extract(month from order_date) as sales_month,
trim(to_char(order_date, 'month')) as month_name,
sum(sales) as total_sales,
sum(profit) as total_profit,
count(distinct order_id) as total_orders
from retail_sales
group by
extract(year from order_date),
extract(month from order_date),
trim(to_char(order_date, 'month'))
order by sales_year, sales_month;
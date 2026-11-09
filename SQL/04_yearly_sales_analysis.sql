-- Analyse yearly sales and growth

with yearly_sales as (
select
extract(year from order_date) as sales_year,
sum(sales) as total_sales,
sum(profit) as total_profit,
count(distinct order_id) as total_orders
from retail_sales
group by extract(year from order_date)
)
select
sales_year,
total_sales,
total_profit,
total_orders,
round(
((total_sales - lag(total_sales) over (order by sales_year)) /
nullif(lag(total_sales) over (order by sales_year), 0)) * 100,
2
) as sales_growth_percentage
from yearly_sales
order by sales_year;
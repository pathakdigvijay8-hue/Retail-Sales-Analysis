-- Analyse sales and profit by product sub-category

select
sub_category,
sum(sales) as total_sales,
sum(profit) as total_profit,
sum(quantity) as total_quantity_sold,
round((sum(profit) / nullif(sum(sales), 0)) * 100, 2) as profit_margin_percentage
from public.retail_sales
group by sub_category
order by total_sales desc;
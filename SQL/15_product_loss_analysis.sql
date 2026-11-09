-- Investigate discount and shipping cost for loss-making products

select
product_name,
round(avg(discount) * 100, 2) as average_discount_percentage,
sum(shipping_cost) as total_shipping_cost,
round((sum(profit) / nullif(sum(sales), 0)) * 100, 2) as profit_margin_percentage
from public.retail_sales
group by product_name
having sum(profit) < 0
order by sum(profit) asc
limit 10;
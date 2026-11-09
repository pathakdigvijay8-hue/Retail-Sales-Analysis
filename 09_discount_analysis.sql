-- Analyse sales and profit by discount groups

select
case
when discount = 0 then '0%'
when discount <= 0.10 then '1-10%'
when discount <= 0.20 then '11-20%'
when discount <= 0.30 then '21-30%'
else 'above 30%'
end as discount_group,
count(*) as total_records,
round(avg(discount) * 100, 2) as average_discount_percentage,
sum(sales) as total_sales,
sum(profit) as total_profit,
round((sum(profit) / nullif(sum(sales), 0)) * 100, 2) as profit_margin_percentage
from retail_sales
group by discount_group
order by min(discount);
-- Data_Quality_Checks

-- check data quality and consistency

-- 1. check total number of records
select count(*) as total_records
from retail_sales;

-- 2. check duplicate row ids
select count(*) - count(distinct row_id) as duplicate_row_ids
from retail_sales;

-- 3. check missing values
select
count(*) filter (where order_id is null) as missing_order_id,
count(*) filter (where order_date is null) as missing_order_date,
count(*) filter (where ship_date is null) as missing_ship_date,
count(*) filter (where customer_id is null) as missing_customer_id,
count(*) filter (where product_id is null) as missing_product_id,
count(*) filter (where sales is null) as missing_sales,
count(*) filter (where profit is null) as missing_profit,
count(*) filter (where postal_code is null) as missing_postal_code
from retail_sales;

-- 4. check complete duplicate records
select
sum(record_count - 1) as extra_duplicate_rows
from (
select count(*) as record_count
from retail_sales
group by
row_id, order_id, order_date, ship_date, ship_mode,
customer_id, customer_name, segment, city, state,
country, postal_code, market, region, product_id,
category, sub_category, product_name, sales, quantity,
discount, profit, shipping_cost, order_priority
having count(*) > 1
) as duplicates;

-- 5. check order date range
select
min(order_date) as earliest_order_date,
max(order_date) as latest_order_date
from retail_sales;

-- 6. check whether any order was shipped before it was placed
select count(*) as shipped_before_order
from retail_sales
where ship_date < order_date;

-- 7. check invalid numeric values
select
count(*) filter (where sales < 0) as negative_sales,
count(*) filter (where quantity <= 0) as invalid_quantity,
count(*) filter (where discount < 0 or discount > 1) as invalid_discount,
count(*) filter (where shipping_cost < 0) as negative_shipping_cost
from retail_sales;



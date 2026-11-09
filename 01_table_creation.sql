-- Creating table sales_analysis

-- retail sales analysis
-- file: 01_table_creation.sql
-- purpose: create the retail_sales table

create table if not exists public.retail_sales (
row_id integer,
order_id varchar(50),
order_date date,
ship_date date,
ship_mode varchar(50),
customer_id varchar(50),
customer_name varchar(150),
segment varchar(50),
city varchar(100),
state varchar(100),
country varchar(100),
postal_code varchar(50),
market varchar(50),
region varchar(50),
product_id varchar(50),
category varchar(50),
sub_category varchar(50),
product_name text,
sales numeric(12,2),
quantity integer,
discount numeric(10,4),
profit numeric(12,2),
shipping_cost numeric(12,2),
order_priority varchar(50)
);
create database supplychain;

use supplychain;
-- select all the tables
select * from dim_customers;
select * from dim_products;
select * from dim_date;
select * from dim_targets_orders;
select * from fact_order_lines;
select * from fact_orders_aggregate;
-- DATA EXPLORATION AND CLEANING
-- describe each table 
describe dim_customers;
describe dim_date;
describe dim_products;
describe dim_target_orders;
describe fact_order_lines;
describe fact_orders_aggregate;

-- regularise the table names
alter table dim_customers rename to customers;
alter table dim_date rename to calendar;
alter table dim_products rename to products;
alter table dim_targets_orders rename to targets;
alter table fact_order_lines rename to orders;
alter table fact_orders_aggregate rename to orders_aggregate;

-- select tables with new table names
select * from customers;
select * from products;
select * from calendar;
select * from targets;
select * from orders;
select * from orders_aggregate;
describe orders;
describe calendar;
# rename the column names for ï»¿date in calendar table and 
# ï»¿order_id in orders_aggregate table 
alter table orders_aggregate
change column ï»¿order_id order_id varchar(100);

alter table calendar
change column ï»¿date date_field date;

alter table orders
change column `In Full` in_full varchar(10),
change column `On Time` on_time varchar(10),
change column `On Time In Full` on_time_in_full varchar(10);

-- change from text to date datatype where required
UPDATE orders
SET 
	order_placement_date = STR_TO_DATE(order_placement_date, '%W, %M %e, %Y'),
    agreed_delivery_date = STR_TO_DATE(agreed_delivery_date, '%W, %M %e, %Y'),
    actual_delivery_date =STR_TO_DATE(actual_delivery_date, '%W, %M %e, %Y');
alter table orders
modify column order_placement_date date,
modify column agreed_delivery_date date,
modify column actual_delivery_date date;


-- DATA ANALYSIS 
-- How many orders were placed in each month?
select count(orders.customer_id) as total_orders,calendar.months
from orders
join calendar on orders.order_placement_date = calendar.date_field
group by calendar.months;

-- weekly trend of late deliveries
select calendar.week_no,
		SUM(datediff(orders.actual_delivery_date,orders.agreed_delivery_date)) as datedifference  
from orders
join calendar on orders.order_placement_date=calendar.date_field
WHERE DATEDIFF(orders.actual_delivery_date, orders.agreed_delivery_date) > 0
group by calendar.week_no;

-- MONTH WITH THE HIGHEST NUMBER OF ORDERS NOT DELIVERED IN FULL
select calendar.months,count(orders.in_full) as incomplete_orders
from calendar
join orders on calendar.date_field=orders.order_placement_date
where orders.in_full< 1
group by calendar.months
order by incomplete_orders
limit 1;
-- august has the highest number of incomplete orders

-- difference between agreed delivery dates and actual delivery dates for all orders
select 	order_id, 
		customer_id,
		datediff(actual_delivery_date,agreed_delivery_date) as datedifference  
from orders;

-- OTIF(on time in full) performance for each city?
SELECT 
    customers.city city,
    COUNT(*) AS total_orders,
    SUM(
        CASE 
            WHEN actual_delivery_date <= agreed_delivery_date 
                 AND in_full = 1 THEN 1 
            ELSE 0 
        END
    ) AS otif_orders,
    ROUND(
        SUM(
            CASE 
                WHEN actual_delivery_date <= agreed_delivery_date 
                     AND in_full = 1 THEN 1 
                ELSE 0 
            END
        ) / COUNT(*) * 100, 2
    ) AS otif_percentage
FROM orders
join customers on orders.customer_id=customers.customer_id
GROUP BY city
ORDER BY otif_percentage DESC;
;

-- total number of orders delivered late?
select count(datediff(actual_delivery_date,agreed_delivery_date))as total_late_delivery
from orders
where datediff(actual_delivery_date,agreed_delivery_date)  > 0;

-- product categories along with the number of unique products in each category
SELECT category, count(distinct(product_name)) as unique_product_count
FROM products
GROUP BY category;

-- Identify the busiest week in terms of order placement
select * from orders;
SELECT 
    calendar.week_no,
    COUNT(*) AS total_orders
FROM orders
JOIN calendar 
    ON orders.order_placement_date = calendar.date_field
GROUP BY calendar.week_no
ORDER BY total_orders DESC
LIMIT 1;-- week 30 has the highest total orders making it the busiest week

-- Which product categories perform best in terms of meeting OTIF targets?
SELECT 
    products.category category,
    COUNT(*) AS total_orders,
    SUM(
        CASE 
            WHEN actual_delivery_date <= agreed_delivery_date AND in_full = 1 THEN 1
            ELSE 0
        END
    ) AS otif_orders,
    ROUND(
        SUM(
            CASE 
                WHEN actual_delivery_date <= agreed_delivery_date AND in_full = 1 THEN 1
                ELSE 0
            END
        ) / COUNT(*) * 100, 2
    ) AS otif_percentage
FROM orders
join products on orders.product_id=products.product_id
GROUP BY category
ORDER BY otif_percentage DESC;

-- What is the percentage of orders that met OTIF criteria?
SELECT 
    COUNT(*) AS total_orders,
    SUM(
        CASE 
            WHEN actual_delivery_date <= agreed_delivery_date AND in_full = 1 THEN 1
            ELSE 0
        END
    ) AS otif_orders,
    ROUND(
        SUM(
            CASE 
                WHEN actual_delivery_date <= agreed_delivery_date AND in_full = 1 THEN 1
                ELSE 0
            END
        ) / COUNT(*) * 100, 2
    ) AS otif_percentage
FROM orders;

-- How many orders were placed on weekends versus weekdays?
SELECT 
    COUNT(*) AS total_orders,
    sum(
        CASE 
            WHEN dayofweek(order_placement_date)in (1,7) then 1
            ELSE 0
        END
    ) AS weekend,
        sum(
            CASE 
                WHEN dayofweek(order_placement_date)between 2 and 6 THEN 1
                ELSE 0
            END
    ) AS weekday
FROM orders;

-- How many orders were delivered on time but not in full?
SELECT 
    COUNT(order_id) AS on_time_not_in_full
FROM orders
WHERE DATEDIFF(actual_delivery_date, agreed_delivery_date) <= 0
  AND in_full = 0;
  
-- Which product category has the highest order quantity?
select sum(orders.order_qty) as total_orders,products.category
from orders
join products on orders.product_id=products.product_id
group by products.category
order by total_orders desc
limit 1;

-- For each customer, calculate the monthly percentage of on-time and in-full deliveries. 
-- Compare these results against the targets to identify any underperforming customers

SELECT 
	c.customer_name,
    o.customer_id,
    DATE_FORMAT(o.actual_delivery_date, '%Y-%m') AS delivery_month,
    COUNT(*) AS total_orders,
    
    SUM(
        CASE 
            WHEN o.actual_delivery_date <= o.agreed_delivery_date AND o.in_full = 1 THEN 1 
            ELSE 0 
        END
    ) AS otif_orders,

    ROUND(
        SUM(
            CASE 
                WHEN o.actual_delivery_date <= o.agreed_delivery_date AND o.in_full = 1 THEN 1 
                ELSE 0 
            END
        ) / COUNT(*) * 100, 2
    ) AS otif_percentage,

    t.otif_target,
    
    CASE 
        WHEN ROUND(SUM(CASE 
                        WHEN o.actual_delivery_date <= o.agreed_delivery_date AND o.in_full = 1 THEN 1 
                        ELSE 0 
                    END) / COUNT(*) * 100, 2) < t.otif_target THEN 'Underperforming'
        ELSE 'On Target'
    END AS performance_status

FROM orders o
JOIN targets t 
    ON o.customer_id = t.customer_id
join customers c 
	on o.customer_id= c.customer_id
   

GROUP BY 
	c.customer_name,
    o.customer_id, 
    delivery_month, 
    t.otif_target
ORDER BY 
    delivery_month, 
    otif_percentage ASC;
    
    
    





  





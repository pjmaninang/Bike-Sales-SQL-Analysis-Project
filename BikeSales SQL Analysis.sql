/* Customer Insights Analysis */

--1. Who are the top 10 customers by total sales amount?
use BikeSalesData;
select TOP 10
	c.customer_key,
	c.first_name,
	c.last_name,
	SUM(s.sales_amount) as total_sales
from
	gold.dim_customers c
	join gold.fact_sales s on c.customer_key = s.customer_key
group by 
	c.customer_key,
	c.first_name,
	c.last_name
order by
	total_sales desc;

--2. What is the breakdown of sales by customer marital status and gender?
select
	COUNT(c.customer_key) as total_customers,
	c.marital_status,
	case when 
		c.gender = 'n/a' then 'Unknown'
		else c.gender
		end as gender_cleaned,
	SUM(s.sales_amount) as total_sales
from 
	gold.dim_customers c
	join gold.fact_sales s on c.customer_key = s.customer_key
group by
	c.marital_status,
	case when 
		c.gender = 'n/a' then 'Unknown'
		else c.gender
		end
order by
	c.marital_status;

--3. Which countries generate the most sales revenue?
select	
	case when 
		c.country = 'n/a' then 'Unknown'
		else c.country
		end as country_cleaned,
	COUNT(s.order_number) as total_orders,
	SUM(s.sales_amount) as total_sales,
	concat(
		cast(sum(s.sales_amount) * 100.0 / SUM(sum(s.sales_amount)) over () as decimal(10,2)), '%') as market_share_pct
from 
	gold.dim_customers c
	join gold.fact_sales s on c.customer_key = s.customer_key
group by 
	case when 
		c.country = 'n/a' then 'Unknown'
		else c.country
		end
order by
	total_sales desc;
	

/* Product & Sales Performance */

--4. Which product lines and categories contribute the most to revenue?
--Product Category
select
	p.category,
	count(s.order_number) as total_orders,
	SUM(s.sales_amount) as total_sales,
	CONCAT(
		cast(sum(s.sales_amount) *100.00 / SUM(sum(s.sales_amount)) over () as decimal(10,2)), '%') as market_share_pct,
	DENSE_RANK() over (order by sum(s.sales_amount) desc) as sales_rank
from
	gold.dim_products p
	join gold.fact_sales s on p.product_key = s.product_key
group by
	p.category
order by
	sales_rank;

--Product Line
select
	p.product_line,
	count(s.order_number) as total_orders,
	SUM(s.sales_amount) as total_sales,
	CONCAT(
		cast(sum(s.sales_amount) *100.00 / SUM(sum(s.sales_amount)) over () as decimal(10,2)), '%') as market_share_pct,
	DENSE_RANK() over (order by sum(s.sales_amount) desc) as sales_rank
from
	gold.dim_products p
	join gold.fact_sales s on p.product_key = s.product_key
group by
	p.product_line
order by
	sales_rank;

--5. What are the top 5 best-selling individual products by revenue and quanitty sold?
with product_sales as (
select
	p.product_name,
	SUM(s.quantity) as total_quantity_sold,
	SUM(s.sales_amount) as total_revenue
from
	gold.dim_products p
	join gold.fact_sales s on p.product_key = s.product_key
group by
	p.product_name
)
select
	product_name,
	total_quantity_sold,
	RANK() over (order by total_quantity_sold desc) as quantity_rank,
	total_revenue,
	RANK() over (order by total_revenue desc) as revenue_rank
from 
	product_sales
order by 
	revenue_rank,
	quantity_rank;

--6. Which products have low sales volumes but high costs?
with products_summary as(
	select
		p.product_name,
		SUM(s.quantity) as total_quantity_sold,
		SUM(s.sales_amount) as total_sales,
		AVG(p.cost) as avg_cost
	from
		gold.dim_products p
		join gold.fact_sales s on p.product_key = s.product_key
	group by
		p.product_name
)
select * 
from(
	select
		product_name,
		total_quantity_sold,
		total_sales,
		avg_cost,
		avg(total_quantity_sold) over () as avg_qty_all,
		avg(avg_cost) over () as avg_cost_all
	from
		products_summary
) ps
where 
	ps.total_quantity_sold < ps.avg_qty_all 
	and ps.avg_cost > ps.avg_cost_all
order by
	ps.avg_cost desc;



/* Trends & Seasonality  */

--7. What is the total sales trend over time?
with sales_summary as (
	select
		year(order_date) as order_year,
		DATEFROMPARTS(year(order_date), month(order_date),1) as order_month_date,
		FORMAT(order_date, 'MMM-yyyy') as order_month,
		COUNT(order_number) as total_orders,
		SUM(sales_amount) as total_sales
	from
		gold.fact_sales
	group by
		year(order_date),
		DATEFROMPARTS(year(order_date), month(order_date),1),
		FORMAT(order_date, 'MMM-yyyy')
)
select
	order_year,
	order_month,
	total_orders,
	total_sales,
	SUM(total_sales) over (partition by order_year order by order_month_date) as running_yearly_revenue,
	total_sales - lag(total_sales) over (partition by order_year order by order_month_date) as monthly_revenue_change,
	CAST(
		 (total_sales - LAG(total_sales) OVER (PARTITION BY order_year ORDER BY order_month_date)) * 100.0
		 / NULLIF(LAG(total_sales) OVER (PARTITION BY order_year ORDER BY order_month_date), 0)
		 AS decimal(10,2)
	  ) AS monthly_growth_pct
from 
	sales_summary
order by 
	order_year;
	
--8. Which months generate the highest sales?
with monthly_revenue_summary as (
	select
		MONTH(order_date) as order_month_date,
		FORMAT(order_date, 'MMM') as order_month,
		COUNT(order_number) as total_orders,
		SUM(sales_amount) as total_sales
	from
		gold.fact_sales
	where 
		MONTH(order_date) is not null
	group by
		MONTH(order_date),
		FORMAT(order_date, 'MMM')
)
select
	order_month,
	total_orders,
	total_sales,
	concat(
		cast(total_sales * 100.0 / SUM(total_sales) over () as decimal (10,2)), '%') as market_share_pct
from
	monthly_revenue_summary
order by
	total_sales desc;

/* Profitability & Operational */

--9. What is the profit margin by product category and product line?
--product category profit margin
with product_category_net as (
	select
		p.category,
		SUM(s.sales_amount) as total_sales,
		SUM(s.quantity * p.cost) as total_cost,
		(SUM(s.sales_amount) - SUM(s.quantity * p.cost)) as net_profit
	from
		gold.dim_products p
		join gold.fact_sales s on p.product_key = s.product_key
	group by
		p.category
)
select
	category,
	total_sales,
	total_cost,
	net_profit,
	concat(
		cast(
			(net_profit * 100/nullif(total_sales,0)) as decimal (10,0)), '%') as net_profit_margin
from 
	product_category_net
order by
	net_profit_margin desc;

--product line profit margin
with product_line_net as (
	select
		p.product_line,
		SUM(s.sales_amount) as total_sales,
		SUM(s.quantity * p.cost) as total_cost,
		(SUM(s.sales_amount) - SUM(s.quantity * p.cost)) as net_profit
	from
		gold.dim_products p
		join gold.fact_sales s on p.product_key = s.product_key
	group by
		p.product_line
)
select
	product_line,
	total_sales,
	total_cost,
	net_profit,
	concat(
	cast(
		(net_profit * 100/nullif(total_sales,0)) as decimal (10,0)), '%') as profit_margin
from 
	product_line_net
order by
	profit_margin desc;

--10. What is the total revenue, cost, and profit by year?
WITH yearly_profit AS (
  SELECT
    YEAR(s.order_date) AS order_year,
    SUM(s.sales_amount) AS total_revenue,
    SUM(s.quantity * p.cost) AS total_cost,
    SUM(s.sales_amount) - SUM(s.quantity * p.cost) AS net_profit
  FROM gold.dim_products p
  JOIN gold.fact_sales s ON p.product_key = s.product_key
  WHERE YEAR(s.order_date) IS NOT NULL
  GROUP BY YEAR(s.order_date)
),
yr AS (
  SELECT
    order_year,
    total_revenue,
    total_cost,
    net_profit,
    LAG(total_revenue) OVER (ORDER BY order_year) AS prev_revenue
  FROM yearly_profit
)
SELECT
  order_year,
  total_revenue,
  CAST(
		CASE 
		  WHEN prev_revenue IS NULL THEN NULL
		  ELSE (total_revenue - prev_revenue) * 100.0 / NULLIF(prev_revenue, 0)
		END AS DECIMAL(10,2))
  AS yoy_growth_pct,
  total_cost,
  net_profit,
  CAST( net_profit * 100.0 / NULLIF(total_revenue, 0) AS DECIMAL(10,2) ) AS net_profit_margin_pct
FROM yr
ORDER BY order_year;


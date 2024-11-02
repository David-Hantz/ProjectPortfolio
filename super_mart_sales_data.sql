/* Exploratory analysis of Super Mart sales data */
select * from customer;
select * from sales;
select * from product;


/* Average age of East region customers */
select avg(age)
from customer
where region = 'East';


/* Average age of West region customers */
select avg(age)
from customer
where region = 'West';


/* Average age of South region customers */
select avg(age)
from customer
where region = 'South';


/* Number of customers in north region with
age between 20 and 30 */
select count(*)
from customer
where age between 20 and 30;


/* Dashboard showing:
	a. total sales ($)
	b.total sales quantity
	c. number of orders
	d. max sales value
	e. min sales value
	f. average sales value */
select product_id,
	sum(sales) as total_sales,
	sum(quantity) as total_quantity,
	count(order_id) as total_order,
	min(sales) as min_sales,
	max(sales) as max_sales,
	avg(sales) as avg_sales
from sales
group by product_id
order by total_sales desc;


/* List of product ID's where the quantity of 
product sold is greater than 10 */
select product_id,
	sum(quantity) as total_quantity
from sales
group by product_id
having sum(quantity) > 10;


/* Total sales done in every state for customer_20_60
and sales_2015 table */
select b.state, 
	sum(sales) as total_sales
from sales_2015 as a 
	left join customer_20_60 as b
	on a.customer_id = b.customer_id
group by b.state;


/* Analyze and find out the montly sales of
sub-category chair. */
select extract (month from order_date) as month_n,
	sum(sales) as total_sales
from sales
where product_id in (select product_id from product
where sub_category = 'Chairs')
group by month_n
order by month_n;


/* Gather data containing product_id, product_name,
category, total sales value of that product and total
quantity sold. */
select a.*,
	sum(b.sales) as total_sales,
	sum(quantity) as total_quantity
from product as a left join sales as b
on a.product_id = b.product_id
group by a.product_id;


/* Gather data with all columns of sales table,
and customer name, customer age, product name and
category in the same result set. */
select c.customer_name, c.age, sp.*
from customer as c
right join (select s.*, p.product_name, p.category
	from sales as s
	left join product as p
on s.product_id = p.product_id) as sp
on c.customer_id = sp.customer_id;
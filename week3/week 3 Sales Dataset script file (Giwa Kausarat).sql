## Core SQL queries
# select clause
select *
from sales_data.sales_data_sample;

#where clause
select *
from sales_data_sample
where PRODUCTLINE = "Motorcycles";

#Order by clause
Select ORDERNUMBER, QUANTITYORDERED, ORDERDATE
from sales_data_sample
order by ORDERDATE;

# group by clause
select status, count(status) as total
from sales_data_sample
group by status;

#having clause
select year_id, sum(quantityordered) as TotalQuantityOrderedPerYear
from sales_data_sample
group by YEAR_ID
having  TotalQuantityOrderedPerYear > 20000;

## Aggregate function
# sum
select sum(sales) as TotalSum
from sales_data_sample;

#avg
select avg(priceeach) as AveragePrice
from sales_data_sample;

#count
select count(ordernumber) as totalOrder
from sales_data_sample;

## Advanced sql concepts
# window functions
# Row_number
select contactlastname, contactfirstname, sales, 
row_number() over(order by sales desc) as row_num
from sales_data_sample;

#rank_number
select contactlastname, contactfirstname, sales, 
rank() over(order by sales desc) as rank_num
from sales_data_sample;

#partiton by
select country, territory, sales,
rank() over(partition by Territory order by sales desc) as number
from sales_data_sample;

##Business problem solving
# top perfoming productline
select productline, sum(sales)  as totalsale
from sales_data_sample
group by productline
order by sum(sales) desc;

# top ten performing cusomers
select contactfirstname, contactlastname, sum(sales)
from sales_data_sample
group by contactfirstname, CONTACTLASTNAME
order by sum(sales) desc
limit 10;

# best sales year
SELECT year_id, SUM(sales) AS revenue
FROM sales_data_sample
GROUP BY year_id
ORDER BY revenue DESC;

#revenue by product
SELECT productline, SUM(sales) AS revenue
FROM sales_data_sample
GROUP BY productline
ORDER BY revenue DESC;

# total revenue
select sum(sales) as revenue
from sales_data_sample;




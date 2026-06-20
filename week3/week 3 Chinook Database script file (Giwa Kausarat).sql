## Core Sql Queries

## Select query
Select *
from customer;

## Where query
Select *
from customer
where Country = 'Brazil';

## order by query
select *
from employee
order by LastName;

## Group By query
Select Country
from customer
group by Country;

## Having query
Select BillingCountry, sum(total) as TotalSale
from invoice
group by BillingCountry
having TotalSale >90;

## Aggregate function
# Sum
select sum(Total) as TotalSale
from invoice;

# average
select avg(Total) as AverageSale
from invoice;

# count
select count(*) as TotalCustomer
from customer;

## inner join
select customer.CustomerId, FirstName, InvoiceDate, Total
from customer
inner join invoice
on customer.CustomerId = invoice.CustomerId;

## left join
select artist.ArtistId, Name, Title
from artist
left join album
on artist.ArtistId = album.ArtistId;

##Right Join
select genre.Name as GenreName, Composer, Track.Name as TrackName
from genre
right join track
on genre.GenreId = track.GenreId;

## Subqueries
# row_number
select BillingCountry, BillingState, BillingCity, total,
row_number() over(order By Total Desc) as RowNum
from invoice;

# rank_number
select BillingCountry, BillingState, BillingCity, total,
rank() over(order By Total Desc) as RankNum
from invoice;

#partition by
# rank each city in the country
select BillingCountry, BillingState, BillingCity, total,
rank() over(partition by BillingCity  order By Total Desc) as StateRank
from invoice;

## Business proble solving
# most performing customer
select  invoice.customerId, FirstName, sum(Total) as amount_spent
from invoice
join customer
on invoice.CustomerId = customer.CustomerId
group by CustomerId
order by amount_spent desc
limit 10;

# top selling country
select BillingCountry, sum(Total) as amount
from invoice
group by BillingCountry
order by amount desc
limit 10;

# custiomer that spent more than the average
    SELECT invoice.CustomerId, FirstName, sum(Total)
    FROM Invoice
    join customer
    on invoice.CustomerId = customer.CustomerId
    GROUP BY CustomerId
    HAVING SUM(Total) >
    (
        SELECT AVG(Total)
        FROM Invoice
    )





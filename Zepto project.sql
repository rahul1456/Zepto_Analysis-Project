drop table if exists zepto;

create table zepto (
sku_id SERIAL Primary key,
Category  varchar(120),
name varchar (150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INT,
discountedSellingPrice NUMERIC(8,2),
weightInGms INT,
outOfStock boolean,
quantity Int
);


---- data exploration ----

---- count of row ---
select count(*) from zepto;

select * from zepto;
--- sample data ----- 
select * from zepto
LIMIT 10;

 ----- looking NULL values -----
 select * from zepto
 where name is null
 or
  Category is null
 or
 mrp is null
 or
 discountPercent is null
  or
 availableQuantity is null
 or
 discountedSellingPrice is null
 or
 weightInGms is null
  or
 outOfStock is null
  or
 quantity is null
  
 ----  differant product categories ------ 

select Distinct category 
from zepto
order by category;

-----  product in stock  vs out of stock ------

select outofstock, count(sku_id)
from zepto
group by outofstock ;

-----  Product name present multiple times ---- 
select name, count(sku_id)  as "Number of SKUs"
from zepto
group by name
having count(sku_id) > 1
Order by count(sku_id) DESC;


----- Data Cleaning  ----- 
--- products with price = 0

select * from zepto
where mrp = 0 OR discountedSellingPrice = 0;

Delete from zepto
where mrp = 0;

----- Convert Paise into rupees ----

Update zepto 
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto


--data analysis  ----

-- Q1. Find the top 10 best-value products based on the discount percentage----

   Select Distinct name, mrp, discountPercent
   from zepto 
   order by discountPercent DESC
   Limit 10;

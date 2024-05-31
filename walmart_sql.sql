CREATE DATABASE IF NOT EXISTS walmart;
CREATE TABLE IF NOT EXISTS sales(
	invoice_id text NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city  VARCHAR(10) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);


select * from sales;

-- How many unique cities does the data have? 

select distinct city from sales;

-- In which city is each branch? 
select distinct city , branch from sales;

-- What is the most selling product line
select product_line,sum(quantity) as quantity from sales group by product_line order by quantity desc;

-- What is the total revenue by month
select month(sales.date) as month, round(sum(total),2) as revnue from sales group by month order by revnue desc;

-- What month had the largest COGS?
select sum(cogs) as cogs,month(sales.date) as month from sales group by month order by cogs desc;

-- What product line had the largest revenue?
select productline, sum(total) as revnue from sales group by product_line order by revnue desc;

-- Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average sales

SELECT 
    s.product_line, 
    s.total,
    IF(s.total > avg_sales.avg_total, 'good', 'bad') AS rating
FROM 
    sales s
JOIN 
    (SELECT 
        product_line, 
        AVG(total) AS avg_total
     FROM 
        sales
     GROUP BY 
        product_line) avg_sales
ON 
    s.product_line = avg_sales.product_line;

-- Which branch sold more products than average product sold?
select branch, sum(quantity) as qty from sales group by branch order by qty desc;

-- What is the most common product line by gender
select product_line, gender ,count(gender) as qty from sales group by gender,product_line order by qty desc;

-- What is the average rating of each product line
select round(avg(rating),2) as avg_rating , product_line from sales group by product_line order by avg_rating desc;


-- What is the gender of most of the customers?
select gender,count(gender) as count from sales group by gender;


-- What is the gender distribution per branch?
select gender , branch ,count(gender) as gen_count from sales group by branch , gender order by branch desc;

-- Which time of the day do customers give most ratings?
select sales.time, round(avg(rating),2) as avg_ratings from sales group by sales.time order by avg_ratings desc;
 
-- Which of the customer types brings the most revenue?
select customer_type , sum(total) as total_revenue from sales group by customer_type order by total_revenue desc;

-- Which city has the largest tax/VAT percent?
select city, round(avg(tax_pct),2) as avg_tax from sales group by city;

-- Which customer type pays the most in VAT?
select customer_type,sum(tax_pct) as total_tax from sales group by customer_type;
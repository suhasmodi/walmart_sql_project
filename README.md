# Walmart Sales Analysis Using SQL Project

## Project Overview
This project aims to analyze Walmart sales data using SQL. By leveraging SQL queries, we can extract valuable insights from the data, such as identifying sales trends, understanding customer behavior, and optimizing inventory management. The analysis helps in making data-driven decisions to enhance business operations and improve sales strategies.

## Dataset

The dataset used for this analysis includes detailed sales transaction data from Walmart. The dataset contains the following key columns:

| Column Name         | Data Type         | Description                                   |
|---------------------|-------------------|-----------------------------------------------|
| `invoice_id`        | `varchar(30) PK`  | Unique identifier for each invoice            |
| `branch`            | `varchar(5)`      | Branch code where the sale was made           |
| `city`              | `varchar(30)`     | City where the branch is located              |
| `customer_type`     | `varchar(30)`     | Type of customer (e.g., Member, Normal)       |
| `gender`            | `varchar(30)`     | Gender of the customer                        |
| `product_line`      | `varchar(100)`    | Category of the product sold                  |
| `unit_price`        | `decimal(10,2)`   | Price per unit of the product                 |
| `quantity`          | `int`             | Number of units sold                          |
| `tax_pct`           | `float(6,4)`      | Tax percentage applied to the sale            |
| `total`             | `decimal(12,4)`   | Total amount for the sale, including tax      |
| `date`              | `datetime`        | Date of the transaction                       |
| `time`              | `time`            | Time of the transaction                       |
| `payment`           | `varchar(15)`     | Payment method used (e.g., Cash, Credit Card) |
| `cogs`              | `decimal(10,2)`   | Cost of goods sold                            |
| `gross_margin_pct`  | `float(11,9)`     | Gross margin percentage                       |
| `gross_income`      | `decimal(12,4)`   | Gross income from the sale                    |
| `rating`            | `float(2,1)`      | Customer rating of the transaction            |
| `time_of_day`       | `varchar(20)`     | Time of day when the transaction occurred     |


## Analysis Objectives

The main objectives of this analysis are:

1. **Sales Trends Analysis**: Identify sales trends over time and across different branches and cities.
2. **Customer Behavior Analysis**: Analyze sales patterns based on customer types and gender.
3. **Product Performance**: Evaluate the performance of different product lines.
4. **Payment Methods**: Understand the distribution of different payment methods used.
5. **Time-Based Analysis**: Analyze sales data based on the time of day and date.
6. **Financial Metrics**: Calculate key financial metrics such as COGS, gross margin, and gross income.
7. **Customer Satisfaction**: Assess customer satisfaction based on ratings.


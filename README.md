Data Analyst Internship - Task 6: Sales Trend Analysis Using Aggregations
Objective
The primary objective of this task was to analyze monthly revenue and order volume to understand sales trends. This involved using SQL aggregation functions and grouping data by time periods.

Tools Used
Database: PostgreSQL / MySQL / SQLite (Please specify which database you used) 
Language: SQL
Dataset
The analysis was performed on an online_sales dataset, specifically focusing on an orders table. The table schema includes:

order_date: The date when the order was placed.
amount: The revenue generated from the order.
product_id: Identifier for the product sold.
(Implicitly order_id from the task description and common database practices, used for COUNT(DISTINCT order_id) )
Solution
1. Database Setup & Data Loading
To begin, I set up the online_sales table in [Your Chosen Database, e.g., PostgreSQL]. A sample orders dataset was used for this analysis.

SQL

-- Example for PostgreSQL (Adjust for MySQL/SQLite as needed)
-- CREATE TABLE online_sales (
--     order_id INT PRIMARY KEY,
--     order_date DATE,
--     amount DECIMAL(10, 2),
--     product_id VARCHAR(10)
-- );

-- If using a CSV, you might mention how you loaded it:
-- E.g., For PostgreSQL: \copy online_sales FROM 'path/to/your/orders.csv' WITH (FORMAT CSV, HEADER TRUE);
-- E.g., For MySQL: LOAD DATA INFILE 'path/to/your/orders.csv' INTO TABLE online_sales FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS;
-- E.g., For SQLite: Using a client like DB Browser for SQLite to import the CSV.
(Replace the comments with the actual DDL and data loading method you used.)

2. SQL Query for Sales Trend Analysis
The following SQL script was used to calculate the monthly total revenue and the total number of distinct orders (order volume). The results are grouped by year and month and ordered chronologically.

SQL

SELECT
    STRFTIME('%Y-%m', order_date) AS sales_month, -- For SQLite
    -- EXTRACT(YEAR FROM order_date) AS sales_year, -- For PostgreSQL/MySQL 
    -- EXTRACT(MONTH FROM order_date) AS sales_month_num, -- For PostgreSQL/MySQL 
    SUM(amount) AS total_revenue, -- Uses SUM() for revenue 
    COUNT(DISTINCT order_id) AS total_orders_volume -- Uses COUNT(DISTINCT order_id) for volume 
FROM
    online_sales
GROUP BY
    sales_month -- For SQLite
    -- sales_year, sales_month_num -- For PostgreSQL/MySQL 
ORDER BY
    sales_month; -- For SQLite 
    -- sales_year, sales_month_num; -- For PostgreSQL/MySQL 
Explanation of the query:

EXTRACT(MONTH FROM order_date): Used to extract the month from the order_date.
GROUP BY year/month: Groups the results by year and month.
SUM(): Utilized to calculate the total revenue for each group.
COUNT(DISTINCT order_id): Used to count the distinct number of orders, representing the order volume for each group.
ORDER BY: Used for sorting the results, typically chronologically by year and month.

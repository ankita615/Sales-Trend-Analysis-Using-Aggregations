-- Create the table
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id VARCHAR(10)
);

-- Load data (example for PostgreSQL using COPY, for MySQL you'd use LOAD DATA INFILE)
-- You would run this from your psql terminal or a client after navigating to the directory of your CSV.
-- \copy online_sales FROM 'path/to/your/orders.csv' WITH (FORMAT CSV, HEADER TRUE);

-- For MySQL, you would use:
-- LOAD DATA INFILE 'path/to/your/orders.csv'
-- INTO TABLE online_sales
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;
SELECT
    STRFTIME('%Y-%m', order_date) AS sales_month, -- For SQLite
    -- EXTRACT(YEAR FROM order_date) AS sales_year, -- For PostgreSQL/MySQL
    -- EXTRACT(MONTH FROM order_date) AS sales_month_num, -- For PostgreSQL/MySQL
    SUM(amount) AS total_revenue, [cite: 3]
    COUNT(DISTINCT order_id) AS total_orders_volume [cite: 3]
FROM
    online_sales
GROUP BY
    sales_month -- For SQLite
    -- EXTRACT(YEAR FROM order_date), -- For PostgreSQL/MySQL
    -- EXTRACT(MONTH FROM order_date) -- For PostgreSQL/MySQL
ORDER BY
    sales_month; -- For SQLite
    -- sales_year, sales_month_num; -- For PostgreSQL/MySQL
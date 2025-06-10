Sales Trend Analysis Using Aggregations

## 📝 Objective

The goal of this task was to analyze **monthly revenue** and **order volume** to identify **sales trends** using SQL aggregation techniques. This included grouping data by time periods and calculating key metrics to help understand business performance.

---

## 🧰 Tools & Technologies Used

* **Database**: SQLite (You can change this to PostgreSQL/MySQL if needed)
* **Language**: SQL
* **Environment**: DB Browser for SQLite / pgAdmin / MySQL Workbench (based on DB choice)

---

## 🗃️ Dataset

The analysis was conducted on a simulated `online_sales` dataset using an `orders` table with the following structure:

| Column Name  | Data Type | Description                      |
| ------------ | --------- | -------------------------------- |
| `order_id`   | INT       | Unique identifier for the order  |
| `order_date` | DATE      | Date when the order was placed   |
| `amount`     | DECIMAL   | Revenue generated from the order |
| `product_id` | VARCHAR   | Identifier for the product sold  |

---

## ⚙️ Database Setup & Data Loading

### SQL Table Creation

```sql
CREATE TABLE online_sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10, 2),
    product_id VARCHAR(10)
);
```

### Data Loading (Example for SQLite)

Use **DB Browser for SQLite** or another client to import a CSV file into the `online_sales` table.

> 💡 For PostgreSQL:

```sql
\copy online_sales FROM 'path/to/orders.csv' WITH (FORMAT CSV, HEADER TRUE);
```

> 💡 For MySQL:

```sql
LOAD DATA INFILE 'path/to/orders.csv' 
INTO TABLE online_sales 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
```

---

## 📈 SQL Query for Sales Trend Analysis

```sql
SELECT
    STRFTIME('%Y-%m', order_date) AS sales_month, -- SQLite
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders_volume
FROM
    online_sales
GROUP BY
    sales_month
ORDER BY
    sales_month;
```

> 🔁 Adjust the query for other DBs:

* **PostgreSQL**:

```sql
SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS sales_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders_volume
FROM
    online_sales
GROUP BY
    sales_month
ORDER BY
    sales_month;
```

* **MySQL**:

```sql
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders_volume
FROM
    online_sales
GROUP BY
    sales_month
ORDER BY
    sales_month;
```

---

## 📌 Output & Insights

The result shows:

* **Monthly Revenue Trends** (`SUM(amount)`)
* **Monthly Order Volume** (`COUNT(DISTINCT order_id)`)
* This allows stakeholders to identify high-performing months and seasonal fluctuations in sales activity.

---

## 📁 Repository Structure

```
📦 Sales-Trend-Analysis
├── 📁 dataset/
│   └── orders.csv
├── 📁 sql/
│   └── sales_trend_analysis.sql
├── 📄 README.md
```

---

## ✅ Conclusion

This task helped strengthen skills in:

* SQL aggregation (`SUM`, `COUNT`)
* Time-based grouping
* Generating business insights from transactional data

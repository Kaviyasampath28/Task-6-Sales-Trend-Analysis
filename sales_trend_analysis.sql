
-- Task 6: Sales Trend Analysis Using Aggregations

-- 1. View sample records
SELECT *
FROM online_sales
LIMIT 10;

-- 2. Monthly revenue and order volume
SELECT
    strftime('%Y', "Order Date") AS year,
    strftime('%m', "Order Date") AS month,
    SUM("Sales") AS monthly_revenue,
    COUNT(DISTINCT "Order ID") AS order_volume
FROM online_sales
GROUP BY
    strftime('%Y', "Order Date"),
    strftime('%m', "Order Date")
ORDER BY
    year,
    month;

-- 3. Top 3 months by sales
SELECT
    strftime('%Y', "Order Date") AS year,
    strftime('%m', "Order Date") AS month,
    SUM("Sales") AS monthly_revenue
FROM online_sales
GROUP BY
    strftime('%Y', "Order Date"),
    strftime('%m', "Order Date")
ORDER BY monthly_revenue DESC
LIMIT 3;

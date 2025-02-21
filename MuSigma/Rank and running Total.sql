--Write a query using the Sales table to calculate the total sales for each sales representative and rank them based on 
--their total sales. Then calculate the running total of sales. (Tables to use Sales)


WITH total_sales AS (
   
    SELECT 
        SaleID,  
        SUM(QuantitySold) AS total_sale 
    FROM Sales 
    GROUP BY SaleID
),
ranking AS (
   
    SELECT 
        SaleID, 
        total_sale, 
        DENSE_RANK() OVER (ORDER BY total_sale DESC) AS sales_rank 
    FROM total_sales
)
SELECT 
    r.SaleID, 
    r.total_sale, 
    r.sales_rank,
    SUM(r.total_sale) OVER (ORDER BY r.total_sale DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM ranking r
ORDER BY r.total_sale DESC;

-- Explanation:
-- total_sales CTE:
-- Groups sales data by SalesRepID and calculates total sales per representative.
-- ranking CTE:
-- Uses DENSE_RANK() to rank representatives based on total sales (higher sales → better rank).
-- Final Query:
-- Retrieves sales ranking and computes a running total using SUM() as a window function.
--Explanation of ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
-- Breaking It Down:
-- 1️⃣ ROWS BETWEEN Clause
-- This clause defines a "window" (range of rows) over which the function operates.
-- 2️⃣ UNBOUNDED PRECEDING
-- Means start from the very first row of the partition.
-- Equivalent to saying, “Include all rows from the start of the result set.”
-- 3️⃣ AND CURRENT ROW
-- Means include all rows up to and including the current row in the calculation.

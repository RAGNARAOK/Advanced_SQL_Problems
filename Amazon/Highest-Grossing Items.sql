-- Problem Link: https://datalemur.com/questions/sql-highest-grossing
-- Assume you're given a table containing data on Amazon customers and their spending on products in different category, 
-- write a query to identify the top two highest-grossing products within each category in the year 2022. 
-- The output should include the category, product, and total spend.

WITH cte AS (
    SELECT category, 
           product,
           SUM(spend) AS total_spend
    FROM product_spend
    WHERE YEAR(transaction_date) = 2022
    GROUP BY category, product
),
ranking AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_spend DESC) AS rk
    FROM cte
)
SELECT category, product, total_spend 
FROM ranking 
WHERE rk IN (1,2);

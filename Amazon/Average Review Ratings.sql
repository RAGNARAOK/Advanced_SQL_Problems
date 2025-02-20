-- problem link: https://datalemur.com/questions/sql-avg-review-ratings
-- Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. 
-- The output should display the month as a numerical value, product ID, 
-- and average star rating rounded to two decimal places. Sort the output first by month and then by product ID

SELECT 
    MONTH(submit_date) AS mth,
    product_id AS product2, 
    ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY MONTH(submit_date), product_id
ORDER BY mth;

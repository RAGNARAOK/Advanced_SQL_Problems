-- problem Link: https://datalemur.com/questions/sql-ibm-db2-product-analytics
-- IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. 
-- The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the 
-- third quarter of 2023 (July to September). Additionally, it should count the number of employees who did not run any queries during this period.

-- Display the number of unique queries as histogram categories, along with the count of employees who executed that number of unique queries.

WITH cte1 AS (
  -- Count distinct queries per employee for Q3 2023
  SELECT 
    employee_id, 
    COUNT(DISTINCT query_id) AS cnt_bkt 
  FROM queries
  WHERE DATEPART(QUARTER, query_starttime) = 3 
    AND DATEPART(YEAR, query_starttime) = 2023
  GROUP BY employee_id
)
SELECT 
  COALESCE(cte1.cnt_bkt, 0) AS unique_queries, 
  COUNT(e.employee_id) AS employee_count
FROM employees e
LEFT JOIN cte1 ON e.employee_id = cte1.employee_id
GROUP BY COALESCE(cte1.cnt_bkt, 0)
ORDER BY unique_queries;

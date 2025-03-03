-- Problem Link : https://datalemur.com/questions/sql-top-three-salaries
-- As part of an ongoing analysis of salary distribution within the company,
-- your manager has requested a report identifying high earners in each department. 
-- A 'high earner' within a department is defined as an employee with a salary 
-- ranking among the top three salaries within that department.

-- You're tasked with identifying these high earners across all departments.
-- Write a query to display the employee's name along with their department name 
-- and salary. In case of duplicates, sort the results of department name in 
-- ascending order, then by salary in descending order. If multiple employees have 
-- the same salary, then order them alphabetically.
-- Note: Ensure to utilize the appropriate ranking window function to handle duplicate salaries effectively.

WITH ranked_salary AS (
  SELECT 
    name,
    salary,
    department_id,
    DENSE_RANK() OVER (
      PARTITION BY department_id ORDER BY salary DESC) AS ranking
  FROM employee
)

SELECT 
  d.department_name,
  s.name,
  s.salary
FROM ranked_salary AS s
INNER JOIN department AS d
  ON s.department_id = d.department_id
WHERE s.ranking <= 3
ORDER BY d.department_name ASC, s.salary DESC, s.name ASC;

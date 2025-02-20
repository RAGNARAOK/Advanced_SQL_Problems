-- problem Link : https://datalemur.com/questions/sql-well-paid-employees
-- Companies often perform salary analyses to ensure fair compensation practices. One useful analysis is to check if there are any
-- employees earning more than their direct managers.
-- As a HR Analyst, you're asked to identify all employees who earn more than their direct managers. The result should include the employee's ID and name.


select e1.employee_id , e1.name as employee_name from 
employee e1 join employee e2 on e1.manager_id = e2.employee_id
where  e1.salary>e2.salary

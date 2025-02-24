-- problem link:https://leetcode.com/problems/find-total-time-spent-by-each-employee/description/?envType=problem-list-v2&envId=database
-- vWrite a solution to calculate the total time in minutes spent by each employee on each day at the office.
-- Note that within one day, an employee can enter and leave more than once. The time spent in the office for a single entry is out_time - in_time.

-- Return the result table in any order.
with intime as(
    select event_day as day, emp_id , sum(in_time) as net_in
    from Employees
    group by event_day,emp_id
),
outtime as(
    select event_day as day, emp_id , sum(out_time) as net_out
    from Employees
    group by event_day,emp_id
)
select i.day ,i.emp_id ,(o.net_out-i.net_in) as total_time from intime i join outtime o
on i.day=o.day and i.emp_id=o.emp_id

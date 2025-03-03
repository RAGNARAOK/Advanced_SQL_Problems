-- Problem Link : https://datalemur.com/questions/time-spent-snaps
-- Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.

-- Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these 
-- activities grouped by age group. Round the percentage to 2 decimal places in the output.

-- Notes:
-- Calculate the following percentages:
-- time spent sending / (Time spent sending + Time spent opening)
-- Time spent opening / (Time spent sending + Time spent opening)
-- To avoid integer division in percentages, multiply by 100.0 and not 100.

SELECT ag.age_bucket , 
round(sum(case when a.activity_type = 'send' then a.time_spent end)*100.0/sum(case when a.activity_type in ('send','open') then a.time_spent end),2) as send_perc,
round(sum(case when a.activity_type = 'open' then a.time_spent end)*100.0/sum(case when a.activity_type in ('send','open') then a.time_spent end),2) as open_perc
from activities a join age_breakdown ag 
on a.user_id = ag.user_id
group by ag.age_bucket


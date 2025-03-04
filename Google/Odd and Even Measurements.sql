-- Problem Link:  https://datalemur.com/questions/odd-even-measurements
-- Assume you're given a table with measurement values obtained from a Google 
-- sensor over multiple days with measurements taken multiple times within each day.

-- Write a query to calculate the sum of odd-numbered and even-numbered measurements 
-- separately for a particular day and display the results in two different columns. 
-- Refer to the Example Output below for the desired format.
-- Definition:
-- Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements,
-- and measurements taken at 2nd, 4th, and 6th times are considered even-numbered measurements.

with filtering as(
  select measurement_id,measurement_value,
  measurement_time,
  cast(measurement_time as DATE) as day,
  row_number() over(partition by cast(measurement_time as DATE) order by measurement_time) as rk 
  from measurements
)
select day,
sum(case when rk%2 <> 0 then measurement_value else 0 end) as odd_sum,
sum(case when rk%2 = 0 then measurement_value else 0 end) as even_sum
from filtering
group by day 
order by day

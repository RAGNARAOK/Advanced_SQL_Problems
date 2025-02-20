-- problem link: https://datalemur.com/questions/completed-trades
-- Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.

-- Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. 
-- Output the city name and the corresponding number of completed trade orders.

select u.city , count(*) as total_orders from users u join trades t 
on u.user_id = t.user_id 
where t.status = 'Completed'
group by u.city
order by count(*) DESC
offset 0 rows fetch next 3 rows only

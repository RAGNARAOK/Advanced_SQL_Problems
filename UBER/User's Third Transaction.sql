-- Problem Link: https://datalemur.com/questions/sql-third-transaction
-- Assume you are given the table below on Uber transactions made by users.
-- Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

with cte as (
  select user_id , spend, transaction_date,
  row_number() over(partition by user_id order by transaction_date) as rank
  from transactions
)
SELECT user_id,spend,transaction_date from cte 
where rank =3


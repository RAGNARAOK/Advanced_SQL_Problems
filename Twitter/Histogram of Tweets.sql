-- problem link: https://datalemur.com/questions/sql-histogram-tweets
-- Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. 
-- Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
-- In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

with cnt as (
  select user_id,count(*) as num_tweets from tweets
  where datepart(YEAR,tweet_date) = 2022
  group by user_id
)
select num_tweets as tweet_bucket , count(*) as user_num from cnt 
group by num_tweets

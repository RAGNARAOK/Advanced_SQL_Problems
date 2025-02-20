-- problem link: https://datalemur.com/questions/sql-page-with-no-likes
-- Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
-- Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

select page_id from pages
where page_id not in (select page_id from page_likes)
order by page_id

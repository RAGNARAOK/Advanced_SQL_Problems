-- problem link: https://datalemur.com/questions/duplicate-job-listings
-- Assume you're given a table containing job postings from various companies on the LinkedIn platform. 
-- Write a query to retrieve the count of companies that have posted duplicate job listings.
-- Definition:
-- Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions


with cte as (
  select j1.company_id from job_listings j1 join job_listings j2
  on j1.company_id = j2.company_id and j1.title =j2.title and
  j1.description = j2.description and j1.job_id	<> j2.job_id	
)
select count(distinct company_id) as duplicate_companies from cte

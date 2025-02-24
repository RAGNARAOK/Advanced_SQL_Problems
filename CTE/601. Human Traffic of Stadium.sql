-- problem Link: https://leetcode.com/problems/human-traffic-of-stadium/description/
-- Write a solution to display the records with three or more rows with consecutive id's, 
-- and the number of people is greater than or equal to 100 for each.
-- Return the result table ordered by visit_date in ascending order.

/* Write your T-SQL query statement below */
with consecutiverows as (
    select id,visit_date,people,
    id-row_number() over(order by id) as group_id
    from Stadium
    where people>=100
),
groupingrows as (
    select id,visit_date,people,count(*) over(partition by group_id) as group_size
    from consecutiverows
)
select id,visit_date,people from groupingrows
where group_size>=3
order by visit_date

-- Intuition
-- First, let's understand what we're looking for:

-- We need groups of 3 or more consecutive IDs
-- Each row in these groups must have people ≥ 100
-- Results should be ordered by visit_date ascending

-- The key insight is that for consecutive IDs:

-- If we subtract the row number (dense rank) from the ID
-- Consecutive IDs will have the same result
-- This will help us group consecutive IDs together

-- Approach
-- Let's break down how this works:

-- First CTE (ConsecutiveRows):

-- Filters out rows where people < 100
-- Uses id - ROW_NUMBER() to create groups
-- If IDs are consecutive (like 1,2,3), they'll have the same group_id

-- Second CTE (GroupedRows):

-- Counts how many rows are in each group using COUNT(*) OVER
-- This tells us which groups have 3+ consecutive rows

-- Final SELECT:

-- Only selects rows from groups with 3+ consecutive IDs
-- Orders by visit_date as required
-- id  row_num  group_id (id - row_num)
-- 1    1         0
-- 2    2         0
-- 3    3         0
-- 5    4         1
-- 6    5         1
-- 7    6         1

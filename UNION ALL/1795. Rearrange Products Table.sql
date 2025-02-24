-- problem link : https://leetcode.com/problems/rearrange-products-table/description/?envType=problem-list-v2&envId=database
-- Write a solution to rearrange the Products table so that each row has (product_id, store, price). 
-- If a product is not available in a store, do not include a row with that product_id and store combination in the result table.
-- Return the result table in any order.
-- The result format is in the following example.
-- Example 1:
-- Input: 
-- Products table:
-- +------------+--------+--------+--------+
-- | product_id | store1 | store2 | store3 |
-- +------------+--------+--------+--------+
-- | 0          | 95     | 100    | 105    |
-- | 1          | 70     | null   | 80     |
-- +------------+--------+--------+--------+
-- Output: 
-- +------------+--------+-------+
-- | product_id | store  | price |
-- +------------+--------+-------+
-- | 0          | store1 | 95    |
-- | 0          | store2 | 100   |
-- | 0          | store3 | 105   |
-- | 1          | store1 | 70    |
-- | 1          | store3 | 80    |
-- +------------+--------+-------+

/* Write your T-SQL query statement below */
with cte as(
    select product_id,
    case when store1 is not null then 'store1' end as store,
    case when store1 is not null then store1 end as price
    from Products
    union all 
    select product_id,
    case when store2 is not null then 'store2' end as store,
    case when store2 is not null then store2 end as price
    from Products
    union all
    select product_id,
    case when store3 is not null then 'store3' end as store,
    case when store3 is not null then store3 end as price
    from Products
)
select * from cte
where store is not null and price is not null
order by product_id

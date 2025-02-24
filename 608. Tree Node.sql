-- Problem Link : https://leetcode.com/problems/tree-node/description/
-- Each node in the tree can be one of three types:

-- "Leaf": if the node is a leaf node.
-- "Root": if the node is the root of the tree.
-- "Inner": If the node is neither a leaf node nor a root node.
-- Write a solution to report the type of each node in the tree.

-- Return the result table in any order.




/* Write your T-SQL query statement below */
select id,
    case when p_id is NULL then 'Root'
         when p_id is not null and id in (select p_id from Tree) then 'Inner'
         else 'Leaf' end as type
         from Tree

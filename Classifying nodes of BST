
-----------------------------------------------Problem Link : https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true -----------------------------
-- nodes which are not in p  are leaf nodes
-- nodes which have p as null are root
-- rest all are inner

SELECT 
    N,
    CASE 
        WHEN P IS NULL THEN 'Root'   
        WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf' 
        ELSE 'Inner' 
    END AS NodeType
FROM BST
ORDER BY N;

-- problem link: https://datalemur.com/questions/tesla-unfinished-parts
-- Tesla is investigating production bottlenecks and they need your help to extract the relevant data. Write a query to determine 
-- which parts have begun the assembly process but are not yet finished.
-- Assumptions:
-- parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
-- An unfinished part is one that lacks a finish_date.
-- This question is straightforward, so let's approach it with simplicity in both thinking and solution.

select part , assembly_step from parts_assembly
where finish_date is null

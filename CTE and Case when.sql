--619. Biggest Single Number
--A single number is a number that appeared only once in the MyNumbers table.
--Find the largest single number. If there is no single number, report null.
--The result format is in the following example.


with cnt as (
    select num, count(*) as num_cnt
    from Mynumbers
    group by num
)
select case when num_cnt >1 then null else num end as num from cnt 
order by num desc
offset 0 rows fetch next 1 rows only

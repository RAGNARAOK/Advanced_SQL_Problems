--Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
--The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.
--Note: Print NULL when there are no more names corresponding to an occupation.
--Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

----------------------------------------------------------------------------------SQL Server-------------------------------------------------------------------------------------

with ranking as (
    select Name , Occupation , 
    row_number() over(partition by Occupation order by Name) as rn
    from OCCUPATIONS
)
select 
    MAX(case when Occupation = 'Doctor' then Name end) as a,
    MAX(case when Occupation = 'Professor' then Name end) as b,
    MAX(case when Occupation = 'Singer' then Name end) as c,
    MAX(case when Occupation = 'Actor' then Name end) as d
    from ranking 
    group by rn

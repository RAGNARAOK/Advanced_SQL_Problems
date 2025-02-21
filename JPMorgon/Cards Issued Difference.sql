-- problem Link: https://datalemur.com/questions/cards-issued-difference
-- Your team at JPMorgan Chase is preparing to launch a new credit card, and to gain some insights, 
-- you're analyzing how many credit cards were issued each month.

-- Write a query that outputs the name of each credit card and the difference in the number of issued cards 
-- between the month with the highest issuance cards and the lowest issuance. Arrange the results based on the largest disparity.

select card_name ,( max(issued_amount) - min(issued_amount)) as diffrence
from monthly_cards_issued
group by card_name
order by diffrence DESC

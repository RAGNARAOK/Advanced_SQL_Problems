-- Problem Link : https://leetcode.com/problems/capital-gainloss/description/
-- Write a solution to report the Capital gain/loss for each stock.
-- The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times.
-- Return the result table in any order.

/* Write your T-SQL query statement below */
with buy as (
    select stock_name,sum(price) as buy_price from Stocks
    where operation = 'Buy'
    group by stock_name
),
sell as (
    select stock_name,sum(price) as sell_price from Stocks
    where operation = 'Sell'
    group by stock_name
)
select b.stock_name , s.sell_price-b.buy_price as capital_gain_loss
from buy b join sell s on b.stock_name=s.stock_name

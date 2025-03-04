-- Problem Link: https://datalemur.com/questions/supercloud-customer
-- A Microsoft Azure Supercloud customer is defined as a customer who has purchased at
-- least one product from every product category listed in the products table.

-- Write a query that identifies the customer IDs of these Supercloud customers.

SELECT 
  customer_id
FROM 
  customer_contracts c
JOIN
  products p
ON
  c.product_id = p.product_id
GROUP BY 
  1
HAVING
  COUNT(DISTINCT product_category) = (SELECT COUNT(DISTINCT product_category) FROM products) 

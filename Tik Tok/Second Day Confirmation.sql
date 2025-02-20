-- problem Link: https://datalemur.com/questions/second-day-confirmation
-- Assume you're given tables with information about TikTok user sign-ups and confirmations through email and text. 
-- New users on TikTok sign up using their email addresses, and upon sign-up, each user receives a text message confirmation to activate their account.
-- Write a query to display the user IDs of those who did not confirm their sign-up on the first day, but confirmed on the second day.
-- Definition:
-- action_date refers to the date when users activated their accounts and confirmed their sign-up through text messages

SELECT DISTINCT e.user_id 
FROM emails e 
JOIN texts t ON e.email_id = t.email_id
WHERE t.signup_action = 'Confirmed' 
AND DATEDIFF(DAY, e.signup_date, t.action_date) = 1;

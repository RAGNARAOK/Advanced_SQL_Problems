-- problem link: https://datalemur.com/questions/teams-power-users
-- Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022.
-- Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.

-- Assumption:

-- No two users have sent the same number of messages in August 2022.

SELECT TOP 2 sender_id, COUNT(*) AS message_count
FROM messages
WHERE YEAR(sent_date) = 2022 
  AND MONTH(sent_date) = 8
GROUP BY sender_id
ORDER BY message_count DESC;

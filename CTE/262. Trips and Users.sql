-- problem link: https://leetcode.com/problems/trips-and-users/description/
-- The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number 
-- of requests with unbanned users on that day.
-- Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between 
-- "2013-10-01" and "2013-10-03" with at least one trip. Round Cancellation Rate to two decimal points.

-- Return the result table in any order.

WITH ValidTrips AS (
    -- Filter trips where both client and driver are NOT banned
    SELECT t.request_at, t.status
    FROM Trips t
    JOIN Users c ON t.client_id = c.users_id AND c.banned = 'No'
    JOIN Users d ON t.driver_id = d.users_id AND d.banned = 'No'
    WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
),
TotalRequests AS (
    -- Count total valid requests per day
    SELECT request_at, COUNT(*) AS total_requests
    FROM ValidTrips
    GROUP BY request_at
),
CanceledRequests AS (
    -- Count only canceled trips per day
    SELECT request_at, COUNT(*) AS canceled_requests
    FROM ValidTrips
    WHERE status IN ('cancelled_by_driver', 'cancelled_by_client')
    GROUP BY request_at
)
SELECT 
    t.request_at AS Day, 
    ROUND(COALESCE(c.canceled_requests, 0) * 1.0 / t.total_requests, 2) AS [Cancellation Rate]
FROM TotalRequests t
LEFT JOIN CanceledRequests c ON t.request_at = c.request_at
ORDER BY t.request_at;

-- Problem Link : https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
-- A median is defined as a number separating the higher half of a data set from the lower half. Query the median 
-- of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places


WITH Ordered AS (
    SELECT LAT_N, 
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
           COUNT(*) OVER () AS total_count
    FROM station
)
SELECT cast(AVG(LAT_N) as decimal(10,4)) AS Median_Salary
FROM Ordered
WHERE rn IN ((total_count + 1) / 2, (total_count + 2) / 2);

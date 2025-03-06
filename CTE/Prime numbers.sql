-- Problem Link : https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true
-- Write a query to print all prime numbers less than or equal to 1000. 
-- Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

WITH Numbers AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1 FROM Numbers WHERE num < 1000
),
PrimeNumbers AS (
    SELECT num
    FROM Numbers
    WHERE num NOT IN (
        SELECT n1.num
        FROM Numbers n1
        JOIN Numbers n2 ON n2.num > 1 AND n2.num < n1.num
        WHERE n1.num % n2.num = 0
    )
)
SELECT STRING_AGG(num, '&') AS prime_numbers
FROM PrimeNumbers
OPTION (MAXRECURSION 1000);

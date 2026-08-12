-- How does each state's average unemployment compare to its region's average?

WITH state_avg AS (
    SELECT u.state_code, s.state_name, s.region,
           ROUND(AVG(u.unemployment_rate), 2) AS state_avg_rate
    FROM unemployment u
    JOIN states s ON u.state_code = s.state_code
    WHERE u.unemployment_rate IS NOT NULL
    GROUP BY u.state_code, s.state_name, s.region
),
region_avg AS (
    SELECT s.region, ROUND(AVG(u.unemployment_rate), 2) AS region_avg_rate
    FROM unemployment u
    JOIN states s ON u.state_code = s.state_code
    WHERE u.unemployment_rate IS NOT NULL
    GROUP BY s.region
)
SELECT sa.state_name, sa.region, sa.state_avg_rate, ra.region_avg_rate,
       ROUND(sa.state_avg_rate - ra.region_avg_rate, 2) AS diff_from_region
FROM state_avg sa
JOIN region_avg ra ON sa.region = ra.region
ORDER BY diff_from_region DESC
LIMIT 5;
-- Highest/lowest average unemployment
-- Which states have the highest and lowest average unemployment rate since 2015?

## Highest
WITH state_avg AS (
    SELECT s.state_name, s.region, ROUND(AVG(u.unemployment_rate), 2) AS avg_rate
    FROM unemployment u
    JOIN states s ON u.state_code = s.state_code
    WHERE u.unemployment_rate IS NOT NULL
    GROUP BY s.state_name, s.region
)
SELECT * FROM state_avg
ORDER BY avg_rate DESC
LIMIT 5;

## Lowest
WITH state_avg AS (
    SELECT s.state_name, s.region, ROUND(AVG(u.unemployment_rate), 2) AS avg_rate
    FROM unemployment u
    JOIN states s ON u.state_code = s.state_code
    WHERE u.unemployment_rate IS NOT NULL
    GROUP BY s.state_name, s.region
)
SELECT * FROM state_avg
ORDER BY avg_rate ASC
LIMIT 5;
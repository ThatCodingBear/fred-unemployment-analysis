-- What's the month-over-month and year-over-year change in unemployment rate by state?

WITH changes AS (
    SELECT u.state_code, s.state_name, u.date, u.unemployment_rate,
           ROUND(u.unemployment_rate - LAG(u.unemployment_rate, 1)
               OVER (PARTITION BY u.state_code ORDER BY u.date), 2) AS mom_change,
           ROUND(u.unemployment_rate - LAG(u.unemployment_rate, 12)
               OVER (PARTITION BY u.state_code ORDER BY u.date), 2) AS yoy_change
    FROM unemployment u
    JOIN states s ON u.state_code = s.state_code
)
SELECT state_name, date, unemployment_rate, mom_change, yoy_change
FROM changes
WHERE date = (SELECT MAX(date) FROM unemployment) AND yoy_change IS NOT NULL
ORDER BY yoy_change DESC
LIMIT 5;
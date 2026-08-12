-- Which states ranked in the top 5 for unemployment in each calendar year?

WITH yearly_avg AS (
    SELECT u.state_code, s.state_name,
           CAST(strftime('%Y', u.date) AS INTEGER) AS yr,
           AVG(u.unemployment_rate) AS avg_rate
    FROM unemployment u
    JOIN states s ON u.state_code = s.state_code
    WHERE u.unemployment_rate IS NOT NULL
    GROUP BY u.state_code, s.state_name, yr
),
ranked AS (
    SELECT *, RANK() OVER (PARTITION BY yr ORDER BY avg_rate DESC) AS rnk
    FROM yearly_avg
)
SELECT yr, state_name, ROUND(avg_rate, 2) AS avg_rate, rnk
FROM ranked
WHERE rnk <= 5
ORDER BY yr, rnk;
-- Which states showed the most consistent year-over-year improvement from 2023–2025?

WITH yearly AS (
    SELECT state_code, CAST(strftime('%Y', date) AS INTEGER) AS yr,
           AVG(unemployment_rate) AS avg_rate
    FROM unemployment
    WHERE date BETWEEN '2023-01-01' AND '2025-12-01' AND unemployment_rate IS NOT NULL
    GROUP BY state_code, yr
),
pivoted AS (
    SELECT state_code,
           MAX(CASE WHEN yr = 2023 THEN avg_rate END) AS y2023,
           MAX(CASE WHEN yr = 2024 THEN avg_rate END) AS y2024,
           MAX(CASE WHEN yr = 2025 THEN avg_rate END) AS y2025
    FROM yearly
    GROUP BY state_code
)
SELECT s.state_name, ROUND(p.y2023, 2) AS y2023, ROUND(p.y2024, 2) AS y2024,
       ROUND(p.y2025, 2) AS y2025, ROUND(p.y2023 - p.y2025, 2) AS total_improvement
FROM pivoted p
JOIN states s ON s.state_code = p.state_code
WHERE p.y2024 < p.y2023 AND p.y2025 < p.y2024
ORDER BY total_improvement DESC;
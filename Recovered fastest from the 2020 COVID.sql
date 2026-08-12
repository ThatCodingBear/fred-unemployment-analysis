-- Which states recovered fastest from the 2020 COVID unemployment spike?

WITH pre_covid AS (
    SELECT state_code, AVG(unemployment_rate) AS baseline_rate
    FROM unemployment
    WHERE date BETWEEN '2019-01-01' AND '2019-12-01' AND unemployment_rate IS NOT NULL
    GROUP BY state_code
),
covid_peak AS (
    SELECT state_code, date AS peak_date, unemployment_rate AS peak_rate,
           ROW_NUMBER() OVER (
               PARTITION BY state_code ORDER BY unemployment_rate DESC, date ASC
           ) AS rn
    FROM unemployment
    WHERE date BETWEEN '2020-01-01' AND '2020-12-01' AND unemployment_rate IS NOT NULL
),
peak AS (
    SELECT state_code, peak_date, peak_rate FROM covid_peak WHERE rn = 1
),
recovery AS (
    SELECT p.state_code, p.peak_date, p.peak_rate, b.baseline_rate,
           MIN(u.date) AS recovery_date
    FROM peak p
    JOIN pre_covid b ON b.state_code = p.state_code
    JOIN unemployment u ON u.state_code = p.state_code
                        AND u.date > p.peak_date
                        AND u.unemployment_rate <= b.baseline_rate
    GROUP BY p.state_code, p.peak_date, p.peak_rate, b.baseline_rate
)
SELECT s.state_name, ROUND(r.baseline_rate, 2) AS baseline_rate, r.peak_rate,
       r.peak_date, r.recovery_date,
       CAST(ROUND((julianday(r.recovery_date) - julianday(r.peak_date)) / 30.0) AS INTEGER)
           AS months_to_recover
FROM recovery r
JOIN states s ON s.state_code = r.state_code
ORDER BY months_to_recover ASC
LIMIT 10;
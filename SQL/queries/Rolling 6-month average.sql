-- What's the rolling 6-month average unemployment rate by state?

SELECT u.state_code, s.state_name, u.date, u.unemployment_rate,
       ROUND(AVG(u.unemployment_rate) OVER (
           PARTITION BY u.state_code
           ORDER BY u.date
           ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
       ), 2) AS rolling_6mo_avg
FROM unemployment u
JOIN states s ON u.state_code = s.state_code
ORDER BY u.state_code, u.date;
# FRED-unemployment-analysis

51 rows across the dataset have `unemployment_rate = NULL`, corresponding to the most recent month(s) not yet finalized by BLS (Bureau of Labor Statistics) at the time of the pull. All queries above explicitly filter these out with `WHERE unemployment_rate IS NOT NULL` rather than silently including nulls in aggregates (SQLite's `AVG()` ignores NULLs by default, but the explicit filter makes that behavior visible rather than implicit).

Regional groupings follow U.S. Census Bureau region definitions (Northeast, Midwest, South, West).

Website: https://fred.stlouisfed.org/


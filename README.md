# FRED-unemployment-analysis

This project has two sections based on the same data sets. The first  section is where I analyzed the data using SQL, and the other using Power BI.

The SQL part has a for with a list of all the queries, and a folder that has screenshots of the results & takeaways.

The Power BI part has and the dashboard and folder with GIFs of each of the sections of the dashboard.


51 rows across the dataset have `unemployment_rate = NULL`, the `NULL` rows are for 10/1/25 for all states. All queries above explicitly filter these out with `WHERE unemployment_rate IS NOT NULL` rather than silently including nulls in aggregates (SQLite's `AVG()` ignores NULLs by default, but the explicit filter makes that behavior visible rather than implicit).



Regional groupings follow U.S. Census Bureau region definitions (Northeast, Midwest, South, West).

Website: https://fred.stlouisfed.org/


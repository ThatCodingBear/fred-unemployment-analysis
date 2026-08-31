# FRED-unemployment-analysis

This project will be analyzing data unemployment data from [FRED (FEDERAL RESERVE BANK of ST. LOUIS)](https://fred.stlouisfed.org/), dates ranging from 
1/1/2015 - 6/1/2026.

The `data` folder contains 2 csv files `states.csv` & `unemployment.csv`.
 * `states.csv` columns are `state_code`, `state_name`, & `region` (Regional groupings follow U.S. Census Bureau region definitions (Northeast, Midwest, South, West)).
 * `unemployment.csv `  columns are `state_code`, `date`, & 

This project has two sections based on the same data sets. The first  section is where I analyzed the data using Power BI, and the other using SQL.

The Power BI section contains the following
  * `Unemployment Dashboard` displays all the visuals for the project.
  * `GIFs` has a walkthrough of each section.
  * `Slide Notes` is a markdown explaining what each visual represents.

The SQL section has the following contents:
  * `Queries`, are all the queries done on the data set
  * `Results`, has a folder for the results of each query as a PNG, along with a markdown file with analysis. 


51 rows across the dataset have `unemployment_rate = NULL`, the `NULL` rows are for 10/1/25 for all states. All queries above explicitly filter these out with `WHERE unemployment_rate IS NOT NULL` rather than silently including nulls in aggregates (SQLite's `AVG()` ignores NULLs by default, but the explicit filter makes that behavior visible rather than implicit).

Website: https://fred.stlouisfed.org/


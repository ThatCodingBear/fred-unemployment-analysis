# Report Summary

## Overview
A Shape Map of the US, with each state colored by its unemployment rate for whatever single month is selected, darker/more intense color meaning a higher rate. A Date slicer above the map controls which month is displayed.
A clustered bar chart by region (Northeast, Midwest, South, West), with two bars per region; the average unemployment rate and the standard deviation (`STDEV.P`) of that rate, so a viewer can see both "how high" and "how unstable" a region has been at the same time, in one chart.

## State Deep Dive
Three KPI cards side by side are State Rate, National Average, and Deviation from National (conditionally formatted,  red >0, green <0). A state slicer picks which state the first and third cards respond to; a date-range slicer controls the period both the state and national numbers are averaged over. The National Average card always reflects the true national figure no matter which state is selected.
A matrix with all 51 states listed as rows, showing their 2019 Baseline Average, current rate (based on data slicer), and the Deviation between them using a colored green-to-red scale. The 2019 baseline column never changes regardless of the slicer; only the current-rate and deviation columns respond to it.


## Trends & Forecast
A line chart of Avg Unemployment Rate over time, filtered to a single state via a slicer, with Power BI's native Analytics-pane Forecast applied with an extending projecting trend and a shaded 95% confidence band for the next several months.
Two KPI cards, one showing MoM Change, one showing YoY Change, with each displaying a number and a directional triangle (▲/▼/▶). A state slicer and a single-month date slicer control both cards together.

## Rankings & Movers
A table listing every state with four columns: Period Start Rate, Period End Rate, Change Over Period, and Rank of Improvement. The columns are sorted so the biggest improvements appear first. A date slicer controls what "start" and "end" mean. 
A horizontal bar chart of the 5 states with the highest average unemployment rate, for whichever year is picked. The underlying ranking is recalculated fresh for the selected year every time the slicer changes.

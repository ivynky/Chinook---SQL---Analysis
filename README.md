# Chinook---SQL---Analysis
This SQL project analyzes a digital music store's performance using the Chinook database. It focuses on customer behavior, product performance, and sales trends. All insights were generated using SQL Server with techniques like joins, aggregations, date functions, and CTEs.

**Tools:** SQL Server  
**Dataset:** Chinook (Kaggle)  
**Focus Areas:** Revenue analysis, customer segmentation, purchase behavior, catalog performance

## Dataset

This project uses the [Chinook CSV Dataset](https://www.kaggle.com/datasets/anurag629/chinook-csv-dataset?select=Invoice.csv) from Kaggle — a simulated dataset of a digital music store.

It includes:
- Customers, invoices, and sales transactions
- Tracks, albums, artists, and genres
- Data imported into SQL Server from CSV format

---
## Business Questions Answered

### Artist & Catalog Performance
- Which artists generate the most revenue?
- What are the top-performing genres by revenue and volume?
- Which albums drive the highest sales?

### Customer Behavior & Value
- Who are the highest-value customers?
- What is the average order value by region?
- Which countries generate the most revenue?

### Time & Purchase Patterns
- How does sales volume vary by year?
- What are the peak purchase periods (weekday vs. weekend)?
- What are the seasonal trends in revenue?
---
## Insights & Recommendations

**Key Insights:**

- Iron Maiden generated the most revenue across all artists.
- Rock is the top-performing genre, making up 37% of all music sold (835 out of 2,240 tracks).
- The United States leads all countries in revenue, contributing $523.06 in total sales.
- Sales peaked in 2010, dropped in 2011, rose slightly in 2012, then declined again in 2013.

**Recommendations:**

- Expand the rock catalog and promote related genres and artists to capitalize on demand.
- Focus on the U.S. market with targeted marketing, upsell opportunities, and loyalty campaigns.
- The drop in sales after 2010 may reflect industry shifts (e.g., early streaming trends). Consider introducing subscriptions, bundles, or exclusive digital offerings.
- Explore partnerships with top artists like Iron Maiden to leverage their influence across new campaigns or catalog launches.
   
---
## Files Included
- `chinook_analysis.sql` — All SQL queries used to analyze the data

## Key Skills Demonstrated

- Writing complex SQL queries using joins, groupings, and filters
- Using `CASE`, `CTE`, and `DATEPART()` for business-focused analysis
- Translating real-world business questions into SQL logic
- Working with a normalized relational database

## Credits

- Dataset: [Chinook CSV Dataset on Kaggle](https://www.kaggle.com/datasets/anurag629/chinook-csv-dataset?select=Invoice.csv)



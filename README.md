# 📊 Sales Analytics Dashboard | Power BI

An interactive **Sales Analytics Dashboard** built using **Microsoft Power BI** to analyze sales performance, customer behavior, product performance, returns, and regional trends.

This project demonstrates the complete data analytics workflow — from raw data preparation and SQL analysis to data modeling, visualization, and business insights.

---

## 🚀 Project Overview

The objective of this project is to transform raw retail sales data into an interactive business intelligence dashboard that helps stakeholders understand:

- Overall sales performance
- Revenue and order trends
- Product and category performance
- Customer purchasing behavior
- Regional and territory-wise performance
- Return patterns
- Year-over-year sales trends
- Business performance across different product segments

The dashboard is designed to help businesses make **data-driven decisions** by presenting complex sales data through interactive visualizations.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Power BI** | Dashboard development & data visualization |
| **Power Query** | Data cleaning & transformation |
| **DAX** | Calculated measures & business metrics |
| **SQL** | Data querying & analysis |
| **Excel** | Data preparation & supporting analysis |
| **CSV** | Source datasets |
| **Data Modeling** | Relationships between multiple tables |

---

## 📂 Project Structure

```text
Sales-Dashboard/
│
├── Sales Dashboard.pbix
├── Da Proj.pbix
├── Practice 2 (1).pbix
│
├── Calendar.csv
├── Customers Table.csv
├── Product Categories.csv
├── Product Subcategories.csv
├── Products.csv
├── Returns.csv
├── Sales 2015.csv
├── Sales 2016.csv
├── Sales 2017.csv
├── Territories.csv
│
├── MapData.xlsx
├── Mixed Data.xlsx
│
├── queries.sql
├── retail_sales_raw.csv
├── retail_sales_cleaned.csv
│
└── README.md

📊 Dataset
The project uses multiple datasets representing different areas of the sales business.
Main Tables
- Sales 2015 – Sales transactions for 2015
- Sales 2016 – Sales transactions for 2016
- Sales 2017 – Sales transactions for 2017
- Customers – Customer information
- Products – Product-level information
- Product Categories – Product category details
- Product Subcategories – Product subcategory details
- Returns – Returned product information
- Territories – Regional/territory information
- Calendar – Date dimension used for time-based analysis

🔄 Data Analytics Workflow

Raw Data
   ↓
Data Cleaning
   ↓
Data Transformation
   ↓
SQL Analysis
   ↓
Data Modeling
   ↓
DAX Measures
   ↓
Power BI Dashboard
   ↓
Business Insights

🧹 Data Cleaning & Transformation
The raw datasets were prepared and transformed before being used for visualization.
Key activities included:
- Removing duplicate records
- Handling missing values
- Standardizing column names
- Correcting data types
- Cleaning inconsistent values
- Combining yearly sales datasets
- Creating calculated columns
- Preparing date fields for time intelligence
- Creating relationships between tables
🗄️ Data Modeling
A relational data model was created in Power BI to connect sales transactions with supporting dimensions.
Key relationships


             Calendar
                 │
                 │
Customers ─── Sales ─── Products
                 │
                 │
            Territories
                 │
                 │
              Returns


Product categories and subcategories are connected with the product dimension to enable hierarchical analysis.

📈 Dashboard Analysis
The dashboard focuses on multiple business perspectives.
💰 Sales Performance
Analyze:
- Total Sales
- Sales trends
- Order performance
- Year-wise performance
- Period-over-period changes
🛍️ Product Analysis
Analyze:
- Top-performing products
- Product categories
- Product subcategories
- Product-level sales contribution
👥 Customer Analysis
Analyze:
- Customer purchasing patterns
- Customer contribution to sales
- Customer-level performance
🌎 Regional Analysis
Analyze sales performance across:
- Territories
- Regions
- Geographic locations
🔄 Returns Analysis
Analyze:
- Returned products
- Return patterns
- Product return performance
- Return-related trends
📊 Power BI Features
The dashboard uses interactive Power BI functionality such as:
- Interactive charts
- KPI cards
- Slicers
- Filters
- Drill-down analysis
- Cross-filtering
- Time-based analysis
- Geographic/map visualization
- Product hierarchy analysis
Users can dynamically filter the dashboard based on different dimensions such as Year, Product, Category, Customer, and Territory.
🧮 DAX & Business Calculations
DAX was used to create business metrics and calculated measures.
Example:

Total Sales =
SUM(Sales[SalesAmount])

Total Orders =
DISTINCTCOUNT(Sales[OrderNumber])

Total Customers =
DISTINCTCOUNT(Sales[CustomerKey])

Total Quantity =
SUM(Sales[OrderQuantity])

Additional measures can include:
- Year-over-Year Growth
- Average Order Value
- Return Rate
- Sales Contribution %
- Monthly Sales
- Running Total
🔎 SQL Analysis
SQL queries were used to explore and analyze the underlying sales data.
Analysis areas include:
- Total sales by year
- Top-selling products
- Sales by category
- Sales by territory
- Customer-level sales
- Monthly sales trends
- Returned products
- Product performance
The queries.sql file contains SQL queries used for analysis.
💡 Business Insights
The dashboard helps answer important business questions such as:
1. Which products generate the highest sales?
2. Which product categories perform best?
3. Which territories contribute the most revenue?
4. How are sales changing year over year?
5. Which customers contribute significantly to overall sales?
6. Which products have higher return activity?
7. Which subcategories have the strongest performance?
8. What are the major sales trends over time?
🎯 Business Value
This dashboard can support business teams in:
- Identifying high-performing products
- Understanding customer behavior
- Monitoring regional performance
- Detecting sales trends
- Evaluating product performance
- Monitoring returns
- Supporting strategic decision-making
- Improving sales planning
📚 Skills Demonstrated
Data Analytics
- Data Cleaning
- Data Transformation
- Exploratory Data Analysis
- Business Analysis
- Data Validation
Power BI
- Power Query
- DAX
- Data Modeling
- Interactive Dashboards
- KPI Development
- Data Visualization
SQL
- SELECT statements
- JOINs
- GROUP BY
- Aggregations
- Filtering
- Subqueries
- Business-oriented SQL analysis
Other
- Excel
- CSV Data Handling
- Data Preparation
- Business Intelligence
👨‍💻 Author
Dhanraj Koshta
Aspiring Data Analyst | Power BI | SQL | Python | Excel
Interested in transforming raw data into meaningful business insights and building data-driven solutions.
⭐ Project Highlights
- 📊 Interactive Power BI Sales Dashboard
- 🗄️ Multi-table data model
- 🧹 Data cleaning & transformation
- 🧮 DAX-based business metrics
- 🔎 SQL-based data analysis
- 📈 Sales trend analysis
- 🛍️ Product & category analysis
- 👥 Customer analysis
- 🌎 Territory-wise analysis
- 🔄 Returns analysis
⭐ If you find this project useful, consider giving the repository a star!

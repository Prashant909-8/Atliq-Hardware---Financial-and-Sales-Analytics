# AtliQ Hardware – Business & Sales Analytics

## 📌 Project Overview

**AtliQ Hardware** is a fictional computer hardware and peripherals company operating across multiple markets and countries.

The objective of this project is to analyze AtliQ Hardware's sales, customer, product, market, and financial data to identify business trends and provide actionable insights for decision-making.

This project demonstrates my practical skills in **SQL, Power BI, Excel, Power Query, Power Pivot, DAX, data cleaning, data modeling, and business analysis**.

---

## 🎯 Business Problem

AtliQ Hardware generates a large volume of sales data across different:

* Markets
* Customers
* Products
* Retailers
* Distributors
* Online channels
* Fiscal periods

However, analyzing millions of records manually makes it difficult to identify:

* Which markets generate the most revenue?
* Which customers contribute the most sales?
* Which products perform the best?
* How are sales changing year over year?
* What is the company's gross margin?
* Which quarters/months have the highest sales?
* How are discounts and deductions affecting net sales?
* Where are opportunities to improve profitability?

The goal of this project is to transform raw business data into meaningful insights through **data analysis and visualization**.

---

# 🛠️ Tools & Technologies

| Tool            | Purpose                                      |
| --------------- | -------------------------------------------- |
| **MySQL**       | Data extraction, transformation and analysis |
| **Power BI**    | Dashboard and visualization                  |
| **Excel**       | Data analysis and validation                 |
| **Power Query** | Data cleaning and transformation             |
| **Power Pivot** | Data modeling                                |
| **DAX**         | Measures and business calculations           |
| **SQL CTEs**    | Advanced analytical queries                  |
| **GitHub**      | Project documentation and version control    |

---

# 📊 Dataset

The project contains multiple interconnected datasets related to AtliQ Hardware.

Major entities include:

* Customers
* Products
* Markets
* Sales transactions
* Pre-invoice deductions
* Post-invoice deductions
* Gross prices
* Fiscal calendar

The main sales transaction table contains approximately:

**1.4 million+ records**

The data covers multiple countries and sales channels such as:

* Retailers
* Distributors
* Online

---

# 🗂️ Project Structure

```text
AtliQ-Hardware-Analytics/
│
├── README.md
│
├── SQL/
│   ├── market_analysis.sql
│   ├── customer_analysis.sql
│   ├── product_analysis.sql
│   ├── sales_analysis.sql
│   └── yoy_analysis.sql
│
├── PowerBI/
│   ├── AtliQ_Hardware_Dashboard.pbix
│   └── Dashboard_Screenshots/
│
├── Excel/
│   └── AtliQ_Analysis.xlsx
│
├── Documentation/
│   └── Project_Report.pdf
│
└── Images/
    ├── dashboard.png
    ├── data_model.png
    └── sql_analysis.png
```

---

# 🔄 Data Analysis Process

The project followed a complete data analytics workflow:

```text
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
DAX Calculations
   ↓
Dashboard Development
   ↓
Business Insights
```

---

# 🧹 Data Cleaning & Transformation

Power Query was used to prepare the data before analysis.

Major activities included:

* Removing unnecessary columns
* Handling duplicate records
* Checking missing values
* Transforming data types
* Creating calculated columns where required
* Combining relevant datasets
* Creating fiscal-year and fiscal-quarter information
* Preparing tables for efficient analysis

Because the original sales data contained more than **1.4 million records**, performance and model efficiency were also considered while designing the final solution.

---

# 🗄️ SQL Analysis

MySQL was used for detailed business analysis.

### Key SQL Analysis

### 1. Market-wise Sales

Calculated sales across different markets to understand regional performance.

```sql
SELECT 
    market,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY market
ORDER BY total_sales DESC;
```

---

### 2. Fiscal Year & Quarter Analysis

Sales were analyzed according to AtliQ's fiscal calendar.

This helped identify:

* Highest-performing quarters
* Monthly sales trends
* Seasonal patterns
* Year-over-year changes

---

### 3. Customer Analysis

Customers were ranked according to their sales contribution.

Advanced SQL techniques such as:

* CTEs
* `DENSE_RANK()`
* Aggregations
* Joins
* Window functions

were used for customer analysis.

---

### 4. Top N Customers

A CTE and ranking logic were used to identify the top customers within a market.

Example approach:

```sql
WITH customer_sales AS (
    SELECT
        customer,
        SUM(sales_amount) AS total_sales
    FROM sales
    GROUP BY customer
)

SELECT
    customer,
    total_sales,
    DENSE_RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM customer_sales;
```

---

### 5. Year-over-Year Analysis

Year-over-year growth was calculated to understand how sales changed compared with the previous fiscal year.

The analysis helps identify:

* Growth markets
* Declining markets
* Customer growth
* Product performance changes

---

# 📐 Data Model

The Power BI model was designed using a **star-schema approach**.

The model contains:

### Fact Table

* Sales transactions

### Dimension Tables

* Customer
* Product
* Market
* Date/Fiscal Calendar

Additional deduction and pricing information was incorporated where required for financial calculations.

This approach helps improve:

* Data organization
* Query performance
* Relationship management
* DAX calculations
* Dashboard usability

---

# 🧮 DAX Measures

Several important business measures were created using DAX.

### Net Sales

```DAX
Net Sales =
SUM(fact_sales[net_sales_amount])
```

### Gross Margin

```DAX
Gross Margin =
[Net Sales] - [COGS]
```

### Gross Margin %

```DAX
Gross Margin % =
DIVIDE(
    [Gross Margin],
    [Net Sales]
)
```

These measures were used throughout the Power BI dashboard.

---

# 📊 Power BI Dashboard

The Power BI dashboard provides an interactive view of AtliQ Hardware's business performance.

### Key Dashboard Areas

* Overall Sales Performance
* Market Performance
* Customer Performance
* Product Performance
* Gross Margin Analysis
* Sales Trend
* Fiscal Year Analysis
* Fiscal Quarter Analysis
* Quantity Sold
* Profitability Analysis

Users can filter the dashboard by different dimensions such as:

* Market
* Customer
* Product
* Fiscal Year
* Fiscal Quarter

---

# 💰 Financial Analysis

A major part of the project was understanding the movement from gross sales to net sales.

The analysis considered:

```text
Gross Sales
     ↓
Pre-Invoice Deductions
     ↓
Net Invoice Sales
     ↓
Post-Invoice Deductions
     ↓
Net Sales
     ↓
COGS
     ↓
Gross Margin
```

This helped provide a more realistic view of the company's financial performance.

---

# 🔍 Key Business Insights

Some important findings from the analysis include:

### 📈 Sales Trends

Sales performance varied significantly across fiscal periods, markets, customers, and products.

### 📅 Quarterly Performance

The analysis showed that **Q2**, particularly the **November–December period**, contributed strongly to sales.

### 🌍 Market Performance

Different markets showed substantial differences in sales contribution, allowing high-performing and underperforming regions to be identified.

### 👥 Customer Performance

A relatively small number of customers contributed a significant portion of overall sales, making customer segmentation and ranking important.

### 📦 Product Performance

Product-level analysis helped identify products with high sales contribution and products requiring further investigation.

### 💵 Gross Margin

Gross Margin and Gross Margin % were calculated to understand not only revenue generation but also profitability.

---

# 🚧 Challenges Faced

During the project, several practical data-analysis challenges were encountered.

### Large Dataset

The main sales table contained approximately **1.4 million+ records**.

Working with large datasets required careful consideration of:

* Data model size
* Query performance
* Relationships
* Unnecessary columns
* Transformation steps

### MySQL Performance

Large joins involving millions of records could cause performance issues, so the analysis was optimized by avoiding unnecessary loading and combining of large tables.

### Fiscal Calendar

AtliQ uses a fiscal calendar that differs from the standard calendar year, requiring special handling for:

* Fiscal year
* Fiscal quarter
* Month
* Year-over-year analysis

---

# 📚 Skills Demonstrated

This project demonstrates my ability to work across the complete data analytics lifecycle.

### Technical Skills

* SQL
* MySQL
* Power BI
* DAX
* Power Query
* Power Pivot
* Excel
* Data Cleaning
* Data Transformation
* Data Modeling
* Star Schema
* Window Functions
* CTEs
* Business Intelligence

### Analytical Skills

* Sales Analysis
* Customer Analysis
* Market Analysis
* Product Analysis
* Financial Analysis
* Profitability Analysis
* YoY Analysis
* KPI Development
* Business Problem Solving
* Data Visualization

---

# 🚀 What I Learned

Through this project, I gained practical experience in:

1. Working with large datasets.
2. Writing SQL queries for business analysis.
3. Using CTEs and window functions.
4. Building a star-schema data model.
5. Creating DAX measures.
6. Cleaning and transforming data using Power Query.
7. Building interactive Power BI dashboards.
8. Performing financial and profitability analysis.
9. Translating business problems into analytical questions.
10. Presenting data-driven business insights.

---

# 📸 Dashboard Preview

Add your Power BI dashboard screenshot here:

```markdown
![AtliQ Hardware Dashboard](Images/dashboard.png)
```

---

# 📁 Project Files

The repository contains:

* SQL queries
* Power BI dashboard
* Excel analysis
* Project documentation
* Dashboard screenshots
* Data-model screenshots

> Note: Original company/project datasets may not be included if their redistribution is restricted.

---

# 👨‍💻 Author

**Prashant Pundir**

Final-Year B.Tech Computer Science Student

### Skills

`SQL` `MySQL` `Power BI` `DAX` `Excel` `Power Query` `Power Pivot` `Python`

---

# ⭐ Project Objective

The primary objective of this project was to demonstrate how raw business data can be transformed into meaningful information and actionable business insights using modern data analytics and business intelligence tools.

**From raw data → analysis → visualization → business insights.**


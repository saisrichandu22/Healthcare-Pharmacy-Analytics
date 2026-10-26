#  Healthcare Pharmacy Analytics Dashboard

##  Project Overview

This project demonstrates an end-to-end Healthcare Pharmacy Analytics solution using SQL Server and Power BI.

The goal is to analyze pharmacy claims data to identify high-cost drugs, provider specialties, state-wise drug spending, and key business KPIs through interactive dashboards.

---

##  Business Problem

Healthcare organizations process millions of pharmacy claims every year. Understanding drug utilization, provider performance, and spending patterns helps organizations:

- Monitor pharmacy costs
- Identify high-cost medications
- Analyze provider specialties
- Track claim trends
- Support data-driven decision making

---

##  Tech Stack

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Power BI Desktop
- SQL
- Star Schema Data Modeling

---



## Project Structure

```text
Healthcare-Pharmacy-Analytics/
├── Dashboard/
│   └── Healthcare_Pharmacy_Analytics.pbix
├── Dataset/
│   ├── raw_partd_prescribers.csv
│   └── clean_pharmacy_claims.csv
├── SQL/
│   ├── Create_Database.sql
│   ├── Create_Tables.sql
│   ├── Load_Star_Schema.sql
│   ├── KPI_Queries.sql
│   └── Validation_Queries.sql
├── python/
│   └── clean_pharmacy_data.py
├── Screenshots/
│   ├── Executive_Summary.png
│   ├── Drug_Analysis.png
│   └── Provider_Analysis.png
├── README.md
└── requirements.txt
```



---

##  Database Design

The project follows a **Star Schema**.

### Fact Table

- fact_pharmacy_claims

### Dimension Tables

- dim_provider
- dim_drug

  
## Data Quality Validation

Implemented SQL-based data quality checks to
support accurate and reliable pharmacy analytics
reporting.

### Validation Checks

- **Record Count Validation:** Checks the number
  of records loaded into fact and dimension tables.

- **Null and Invalid Value Checks:** Identifies
  missing provider/drug keys, invalid claim counts,
  and negative drug costs.

- **Referential Integrity:** Detects fact records
  without matching provider or drug dimension
  records.

- **Duplicate Detection:** Identifies duplicate
  provider NPIs and drug name combinations.

- **KPI Reconciliation:** Calculates total claims,
  total drug cost, and average cost per claim for
  comparison with Power BI dashboard metrics.

### Business Value

These validation checks help identify potential
data quality issues, support accurate KPI reporting,
and improve confidence in analytical results.

### SQL Implementation

[View SQL Validation Queries](SQL/Validation_Queries.sql)

---


## Database Setup

This project uses SQL Server to store and analyze
cleaned pharmacy claims data.

### Setup Steps

1. Create the database using
   `SQL/Create_Database.sql`.

2. Create the staging table using
   `SQL/Create_Staging_Table.sql`.

3. Import `Dataset/clean_pharmacy_claims.csv`
   into `dbo.stg_pharmacy_claims`.

4. Create the dimension and fact tables using
   `SQL/Create_Tables.sql`.

5. Review business-key uniqueness and data quality
   before running `SQL/Load_Star_Schema.sql`.

6. For a fresh, empty database, load the
   dimension and fact tables using
   `SQL/Load_Star_Schema.sql`.

7. Validate the data using
   `SQL/Validation_Queries.sql`.

8. Open the Power BI report from
   `Dashboard/Healthcare_Pharmacy_Analytics.pbix`.

### Data Pipeline

Raw Pharmacy Data
→ Python Data Cleaning
→ Cleaned CSV Dataset
→ SQL Staging Table
→ Star Schema
→ Power BI Dashboards

### Notes

- Use a fresh database for initial setup.
- Verify imported CSV column mappings.
- Resolve duplicate dimension keys before
  loading the fact table.
- Avoid rerunning data loads without checking
  for existing records.
- Update Power BI database connection settings
  when running the project on another computer.

---

##  Dashboard Pages


### Executive Summary

Displays:

- Total Claims
- Total Drug Cost
- Average Cost per Claim
- Provider Count
- Drug Count
- Top 10 Drugs by Cost
- Claims by Provider Specialty
- Top States by Drug Cost

---

### Drug Analysis

Includes:

- Top Drugs by Total Drug Cost
- Top Drugs by Total Claims
- Drug Cost Distribution
- Drug Details Table
- Brand Filters
- Generic Drug Filters

---

### Provider Analysis

Includes:

- Provider Count KPI
- Claims by Provider Specialty
- Drug Cost by Provider State
- Provider Specialty Distribution
- Provider Filters
- State Filters

---

##  Key KPIs

- Total Claims
- Total Drug Cost
- Average Cost per Claim
- Provider Count
- Drug Count

---

##  Dashboard Screenshots

### Executive Summary

<img width="1916" height="1133" alt="Executive_Summary" src="https://github.com/user-attachments/assets/45b6d402-2c1e-4bc5-98b0-3decae2c8fae" />


### Drug Analysis

<img width="1920" height="1115" alt="Drug_Analysis" src="https://github.com/user-attachments/assets/7eb78197-4573-4dda-9923-2a9e16b8be35" />

### Provider Analysis

<img width="1914" height="1119" alt="Provider_Analysis" src="https://github.com/user-attachments/assets/39d218aa-abc8-4f07-a737-85720c7d9fe8" />


---

## Key Insights

### 1. Drug Spending Analysis
- Analyzed total drug spending and claim volumes across brand and generic medications.
- Identified the highest-cost drugs using SQL aggregations and Power BI visualizations.
- Used total drug cost and average cost per claim as key reporting metrics.

**Business Value:** Helps identify major contributors to pharmacy spending and areas for further cost investigation.

### 2. Provider Specialty Analysis
- Compared pharmacy claim volumes across provider specialties.
- Analyzed prescribing activity and medication utilization using interactive dashboards.

**Business Value:** Supports investigation of claim-volume differences and prescribing patterns across specialties.

### 3. Geographic Spending Analysis
- Compared total drug spending across provider states.
- Developed visualizations to identify geographic spending patterns.

**Business Value:** Helps highlight geographic differences that may warrant further investigation of claim volume and spending.

### 4. Data Modelling and Reporting
- Designed a star-schema model with pharmacy claims, provider and drug tables.
- Developed SQL queries for KPI calculation and basic data validation.
- Built three Power BI dashboard pages: Executive Summary, Drug Analysis and Provider Analysis.

**Business Value:** Demonstrates how SQL and Power BI can turn pharmacy claims data into accessible business reporting.
  

---

##  Future Enhancements

- Add time-series analysis.
- Build predictive analytics for future drug spending.
- Integrate Azure SQL Database.
- Publish reports to Power BI Service.
- Automate data refresh.

---

## Author

Sai Sri Chandana

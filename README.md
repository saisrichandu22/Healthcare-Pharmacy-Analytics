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

##  Project Structure


Healthcare-Pharmacy-Analytics

 - Dataset
 - Images
 - PowerBI
 - SQL
 - README.md
 - requirements.txt
 - .gitignore


---

##  Database Design

The project follows a **Star Schema**.

### Fact Table

- fact_pharmacy_claims

### Dimension Tables

- dim_provider
- dim_drug

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

(Drug_Analysis.png)

### Drug Analysis

(Add Drug_Analysis.png)

### Provider Analysis

(Add Provider_Analysis.png)

---

##  Key Insights

- Identified the top 10 highest-cost drugs.
- Analyzed pharmacy spending across provider specialties.
- Compared drug costs across different states.
- Built interactive dashboards with slicers and filters.
- Designed a Star Schema for efficient reporting.

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

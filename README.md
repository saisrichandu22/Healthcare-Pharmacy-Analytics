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

<img width="1916" height="1133" alt="Executive_Summary" src="https://github.com/user-attachments/assets/45b6d402-2c1e-4bc5-98b0-3decae2c8fae" />


### Drug Analysis

<img width="1920" height="1115" alt="Drug_Analysis" src="https://github.com/user-attachments/assets/7eb78197-4573-4dda-9923-2a9e16b8be35" />

### Provider Analysis

<img width="1914" height="1119" alt="Provider_Analysis" src="https://github.com/user-attachments/assets/39d218aa-abc8-4f07-a737-85720c7d9fe8" />


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

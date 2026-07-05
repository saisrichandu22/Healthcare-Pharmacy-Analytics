USE PharmacyAnalytics;
GO

CREATE TABLE dim_provider
(
    provider_key INT IDENTITY(1,1) PRIMARY KEY,
    provider_npi BIGINT,
    provider_first_name VARCHAR(100),
    provider_last_name VARCHAR(100),
    provider_city VARCHAR(100),
    provider_state VARCHAR(10),
    provider_specialty VARCHAR(200)
);

CREATE TABLE dim_drug
(
    drug_key INT IDENTITY(1,1) PRIMARY KEY,
    brand_name VARCHAR(200),
    generic_name VARCHAR(200)
);

CREATE TABLE fact_pharmacy_claims
(
    claim_key INT IDENTITY(1,1) PRIMARY KEY,
    provider_key INT,
    drug_key INT,
    total_claims FLOAT,
    total_30_day_fills FLOAT,
    total_drug_cost FLOAT,
    total_beneficiaries FLOAT,
    cost_per_claim FLOAT,
    cost_per_30_day_fill FLOAT
);
GO
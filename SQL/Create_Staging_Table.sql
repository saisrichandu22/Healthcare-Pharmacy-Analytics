
USE PharmacyAnalytics;
GO

-- Create staging table for cleaned pharmacy data
-- Only creates the table if it does not exist

IF OBJECT_ID('dbo.stg_pharmacy_claims', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.stg_pharmacy_claims
    (
        provider_npi BIGINT NULL,
        provider_first_name VARCHAR(255) NULL,
        provider_last_name VARCHAR(255) NULL,
        provider_city VARCHAR(255) NULL,
        provider_state VARCHAR(30) NULL,
        provider_specialty VARCHAR(255) NULL,
        brand_name VARCHAR(255) NULL,
        generic_name VARCHAR(255) NULL,
        total_claims FLOAT NULL,
        total_30_day_fills FLOAT NULL,
        total_drug_cost FLOAT NULL,
        total_beneficiaries FLOAT NULL,
        cost_per_claim FLOAT NULL,
        cost_per_30_day_fill FLOAT NULL
    );
END;
GO

-- Check staging table structure
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 'stg_pharmacy_claims'
ORDER BY ORDINAL_POSITION;

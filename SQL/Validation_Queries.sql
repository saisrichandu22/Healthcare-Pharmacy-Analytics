USE PharmacyAnalytics;
GO

-- ============================================
-- 1. RECORD COUNT VALIDATION
-- ============================================

SELECT
    'dim_provider' AS TableName,
    COUNT_BIG(*) AS RecordCount
FROM dim_provider

UNION ALL

SELECT
    'dim_drug',
    COUNT_BIG(*)
FROM dim_drug

UNION ALL

SELECT
    'fact_pharmacy_claims',
    COUNT_BIG(*)
FROM fact_pharmacy_claims;


-- ============================================
-- 2. NULL AND INVALID VALUE VALIDATION
-- ============================================

SELECT
    COUNT_BIG(*) AS TotalRecords,

    SUM(CASE
        WHEN provider_key IS NULL
        THEN 1 ELSE 0 END
    ) AS MissingProviderKeys,

    SUM(CASE
        WHEN drug_key IS NULL
        THEN 1 ELSE 0 END
    ) AS MissingDrugKeys,

    SUM(CASE
        WHEN total_claims IS NULL
          OR total_claims <= 0
        THEN 1 ELSE 0 END
    ) AS InvalidClaims,

    SUM(CASE
        WHEN total_drug_cost IS NULL
          OR total_drug_cost < 0
        THEN 1 ELSE 0 END
    ) AS InvalidDrugCosts

FROM fact_pharmacy_claims;


-- ============================================
-- 3. REFERENTIAL INTEGRITY VALIDATION
-- ============================================

-- Fact records without a matching provider
SELECT
    COUNT_BIG(*) AS MissingProviderReferences
FROM fact_pharmacy_claims f
LEFT JOIN dim_provider p
    ON f.provider_key = p.provider_key
WHERE p.provider_key IS NULL;


-- Fact records without a matching drug
SELECT
    COUNT_BIG(*) AS MissingDrugReferences
FROM fact_pharmacy_claims f
LEFT JOIN dim_drug d
    ON f.drug_key = d.drug_key
WHERE d.drug_key IS NULL;


-- ============================================
-- 4. DUPLICATE BUSINESS KEY VALIDATION
-- ============================================

-- Duplicate provider NPIs
SELECT
    provider_npi,
    COUNT_BIG(*) AS DuplicateCount
FROM dim_provider
WHERE provider_npi IS NOT NULL
GROUP BY provider_npi
HAVING COUNT_BIG(*) > 1;


-- Duplicate drug name combinations
SELECT
    brand_name,
    generic_name,
    COUNT_BIG(*) AS DuplicateCount
FROM dim_drug
GROUP BY
    brand_name,
    generic_name
HAVING COUNT_BIG(*) > 1;


-- ============================================
-- 5. KPI RECONCILIATION
-- ============================================

SELECT
    SUM(total_claims) AS TotalClaims,
    SUM(total_drug_cost) AS TotalDrugCost,

    SUM(total_drug_cost)
      / NULLIF(SUM(total_claims), 0)
      AS AverageCostPerClaim

FROM fact_pharmacy_claims;


-- ============================================
-- 6. SAMPLE FACT RECORDS
-- ============================================

SELECT TOP 10 *
FROM fact_pharmacy_claims
ORDER BY claim_key;

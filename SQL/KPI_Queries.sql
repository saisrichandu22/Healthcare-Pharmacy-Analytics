USE PharmacyAnalytics;
GO

SELECT
    SUM(total_claims) AS TotalClaims,
    SUM(total_drug_cost) AS TotalDrugCost,
    SUM(total_drug_cost) / NULLIF(SUM(total_claims), 0) AS AvgCostPerClaim
FROM fact_pharmacy_claims;

SELECT TOP 10
    d.brand_name,
    d.generic_name,
    SUM(f.total_drug_cost) AS TotalDrugCost
FROM fact_pharmacy_claims f
JOIN dim_drug d
    ON f.drug_key = d.drug_key
GROUP BY d.brand_name, d.generic_name
ORDER BY TotalDrugCost DESC;

SELECT TOP 10
    p.provider_specialty,
    SUM(f.total_claims) AS TotalClaims
FROM fact_pharmacy_claims f
JOIN dim_provider p
    ON f.provider_key = p.provider_key
GROUP BY p.provider_specialty
ORDER BY TotalClaims DESC;

SELECT TOP 10
    p.provider_state,
    SUM(f.total_drug_cost) AS TotalDrugCost
FROM fact_pharmacy_claims f
JOIN dim_provider p
    ON f.provider_key = p.provider_key
GROUP BY p.provider_state
ORDER BY TotalDrugCost DESC;
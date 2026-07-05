USE PharmacyAnalytics;
GO

SELECT COUNT(*) AS ProviderCount
FROM dim_provider;

SELECT COUNT(*) AS DrugCount
FROM dim_drug;

SELECT COUNT(*) AS FactCount
FROM fact_pharmacy_claims;

SELECT TOP 10 *
FROM fact_pharmacy_claims;
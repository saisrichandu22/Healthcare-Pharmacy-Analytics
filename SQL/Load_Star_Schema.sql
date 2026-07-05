USE PharmacyAnalytics;
GO

INSERT INTO dim_provider
(
    provider_npi,
    provider_first_name,
    provider_last_name,
    provider_city,
    provider_state,
    provider_specialty
)
SELECT DISTINCT
    provider_npi,
    provider_first_name,
    provider_last_name,
    provider_city,
    provider_state,
    provider_specialty
FROM stg_pharmacy_claims;

INSERT INTO dim_drug
(
    brand_name,
    generic_name
)
SELECT DISTINCT
    brand_name,
    generic_name
FROM stg_pharmacy_claims;

INSERT INTO fact_pharmacy_claims
(
    provider_key,
    drug_key,
    total_claims,
    total_30_day_fills,
    total_drug_cost,
    total_beneficiaries,
    cost_per_claim,
    cost_per_30_day_fill
)
SELECT
    p.provider_key,
    d.drug_key,
    s.total_claims,
    s.total_30_day_fills,
    s.total_drug_cost,
    s.total_beneficiaries,
    s.cost_per_claim,
    s.cost_per_30_day_fill
FROM stg_pharmacy_claims s
JOIN dim_provider p
    ON s.provider_npi = p.provider_npi
JOIN dim_drug d
    ON s.brand_name = d.brand_name
   AND s.generic_name = d.generic_name;
GO
import pandas as pd
import numpy as np

RAW_FILE = "C:/Users/saisr/OneDrive/Desktop/pharmacy-claims-analytics/data/raw_partd_prescribers.csv"
OUTPUT_FILE = "C:/Users/saisr/OneDrive/Desktop/pharmacy-claims-analytics/data/clean_pharmacy_claims.csv"

def clean_currency_numeric(df, column):
    df[column] = pd.to_numeric(df[column], errors="coerce").fillna(0)
    return df

def main():
    df = pd.read_csv(RAW_FILE, low_memory=False)

    # Keep only useful columns
    columns = [
        "Prscrbr_NPI",
        "Prscrbr_First_Name",
        "Prscrbr_Last_Org_Name",
        "Prscrbr_City",
        "Prscrbr_State_Abrvtn",
        "Prscrbr_Type",
        "Brnd_Name",
        "Gnrc_Name",
        "Tot_Clms",
        "Tot_30day_Fills",
        "Tot_Drug_Cst",
        "Tot_Benes"
    ]

    df = df[columns]

    # Rename columns
    df = df.rename(columns={
        "Prscrbr_NPI": "provider_npi",
        "Prscrbr_First_Name": "provider_first_name",
        "Prscrbr_Last_Org_Name": "provider_last_name",
        "Prscrbr_City": "provider_city",
        "Prscrbr_State_Abrvtn": "provider_state",
        "Prscrbr_Type": "provider_specialty",
        "Brnd_Name": "brand_name",
        "Gnrc_Name": "generic_name",
        "Tot_Clms": "total_claims",
        "Tot_30day_Fills": "total_30_day_fills",
        "Tot_Drug_Cst": "total_drug_cost",
        "Tot_Benes": "total_beneficiaries"
    })

    # Clean text
    text_columns = [
        "provider_first_name",
        "provider_last_name",
        "provider_city",
        "provider_state",
        "provider_specialty",
        "brand_name",
        "generic_name"
    ]

    for col in text_columns:
        df[col] = df[col].astype(str).str.strip().str.upper()

    # Clean numeric columns
    numeric_columns = [
        "total_claims",
        "total_30_day_fills",
        "total_drug_cost",
        "total_beneficiaries"
    ]

    for col in numeric_columns:
        df = clean_currency_numeric(df, col)

    # Remove bad rows
    df = df[df["provider_npi"].notna()]
    df = df[df["brand_name"].notna()]
    df = df[df["total_claims"] > 0]

    # Derived columns
    df["cost_per_claim"] = df["total_drug_cost"] / df["total_claims"]
    df["cost_per_30_day_fill"] = df["total_drug_cost"] / df["total_30_day_fills"].replace(0, np.nan)
    df["cost_per_30_day_fill"] = df["cost_per_30_day_fill"].fillna(0)

    df.to_csv(OUTPUT_FILE, index=False)

    print("Cleaning completed")
    print("Rows:", len(df))
    print("Output:", OUTPUT_FILE)

if __name__ == "__main__":
    main()
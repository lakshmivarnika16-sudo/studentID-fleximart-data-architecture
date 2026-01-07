print("ETL pipeline STARTED")
import pandas as pd

customers_df = pd.read_csv("../data/customers.csv", on_bad_lines="skip")
products_df = pd.read_csv("../data/products.csv", on_bad_lines="skip")
catalog_df = pd.read_csv("../data/product_catalog.csv", on_bad_lines="skip")
sales_df = pd.read_csv("../data/sales.csv", on_bad_lines="skip")


print("Customers rows:", len(customers_df))
print("Products rows:", len(products_df))
print("Catalog rows:", len(catalog_df))
print("Sales rows:", len(sales_df))


print("\n--- DATA CLEANING STARTED ---")

# Check missing values
print("\nMissing values:")
print("Customers:\n", customers_df.isna().sum())
print("Products:\n", products_df.isna().sum())
print("Catalog:\n", catalog_df.isna().sum())
print("Sales:\n", sales_df.isna().sum())

# Remove duplicate rows
customers_df = customers_df.drop_duplicates()
products_df = products_df.drop_duplicates()
catalog_df = catalog_df.drop_duplicates()
sales_df = sales_df.drop_duplicates()

print("\nAfter removing duplicates:")
print("Customers rows:", len(customers_df))
print("Products rows:", len(products_df))
print("Catalog rows:", len(catalog_df))
print("Sales rows:", len(sales_df))




print("\n--- DATA MERGING STARTED ---")

# Merge sales with products
sales_products_df = sales_df.merge(
    products_df,
    on="product_id",
    how="left"
)

# Merge with customers
final_df = sales_products_df.merge(
    customers_df,
    on="customer_id",
    how="left"
)

print("Final merged rows:", len(final_df))
print(final_df.head())


print("\n--- DATA LOADING STARTED ---")

output_path = "../reports/final_sales_report.csv"
final_df.to_csv(output_path, index=False)

print("Final report saved to:", output_path)

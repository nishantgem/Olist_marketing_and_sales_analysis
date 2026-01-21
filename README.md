# marketing_and_sales_funnel_analysis

Analyze the Brazilian E‑Commerce Public Dataset by Olist to measure marketing and sales funnel performance from order creation to delivery and review.[web:11][web:13]

## Goals
- Measure funnel efficiency: Created → Approved → Shipped → Delivered → Reviewed.[web:11]
- Find drop‑offs and delays by product, customer, region.
- Identify high‑value customers, categories, and sellers.
- Study impact of delivery performance and payment methods on satisfaction and repeat behavior.[web:13][web:19]

## Stack
- Python (pandas, SQLAlchemy/psycopg2) for ETL.[web:20]
- PostgreSQL (via DBeaver) as data warehouse.[web:11]
- Tableau for dashboards.

## Structure
```text
data_raw/          # raw Kaggle CSVs
data_processed/    # cleaned / joined outputs
notebooks/         # exploratory analysis
src/
  config.py
  extract_load.py
  transform_metrics.py
sql/
  create_tables.sql
  transformations.sql
tableau/
  workbook_notes.md

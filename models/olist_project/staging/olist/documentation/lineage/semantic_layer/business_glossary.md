# 📘 Business Glossary — Semantic Layer Dictionary

This glossary defines key fields across the Olist marketing and sales funnel.  
It helps business users understand what each column means and how to use it in dashboards.

---

## 🧾 Orders

| Field | Description |
|-------|-------------|
| order_id | Unique identifier for each order |
| customer_id | Internal ID linking order to customer |
| order_status | Status of the order (e.g., delivered, shipped) |
| order_purchase_ts | Timestamp when the order was placed |
| order_approved_ts | Timestamp when payment was approved |
| order_carrier_delivered_ts | When the carrier received the package |
| order_customer_delivered_ts | When the customer received the package |
| order_estimated_delivery_ts | Expected delivery date |
| delivery_days | Actual delivery time in days |

---

## 📦 Order Items

| Field | Description |
|-------|-------------|
| order_item_id | Line item number within an order |
| product_id | Product purchased |
| price | Price paid for the item |
| freight_value | Shipping cost for the item |

---

## 🛍 Products

| Field | Description |
|-------|-------------|
| product_category_name | Category of the product |
| product_name_length | Length of product name text |
| product_description_length | Length of product description |
| product_photos_qty | Number of product photos |

---

## 👤 Customers

| Field | Description |
|-------|-------------|
| customer_id | Internal customer ID |
| customer_unique_id | Unique shopper identity across multiple orders |
| customer_city | City where the customer lives |
| customer_state | State where the customer lives |

---

## 🏪 Sellers

| Field | Description |
|-------|-------------|
| seller_id | Unique seller identifier |
| seller_city | Seller’s city |
| seller_state | Seller’s state |

---

## 📈 Marketing Funnel

| Field | Description |
|-------|-------------|
| mql_id | Marketing Qualified Lead identifier |
| first_contact_ts | When the lead first interacted |
| landing_page_id | Landing page that generated the lead |
| origin | Lead source (ads, organic, referral) |
| won_ts | When the deal was closed |
| business_segment | Seller’s business category |
| lead_type | Type of lead (inbound/outbound) |
| lead_behaviour_profile | Behavioral classification of lead |
| has_company | Whether the lead represents a company |
| has_gtin | Whether the seller uses GTIN codes |
| average_stock | Typical inventory level |
| business_type | Seller’s business model |

---

# 🎯 Purpose

This glossary ensures:
- consistent understanding across teams  
- clarity in Tableau dashboards  
- alignment between dbt models and business logic  

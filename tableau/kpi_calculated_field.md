
---

# 📌 KPI Definitions

| KPI | Definition | Source |
|-----|------------|--------|
| **MQLs** | Count of marketing qualified leads | `fact_mqls` |
| **Closed Deals** | Count of deals with `won_ts` not null | `fact_closed_deals` |
| **Orders** | Count of unique `order_id` | `fact_orders` |
| **Order Items** | Count of `order_item_id` | `fact_order_items` |
| **Conversion Rate** | Closed Deals ÷ MQLs | Derived |
| **Avg Delivery Days** | AVG(`delivery_days`) | `fact_orders` |
| **Revenue** | SUM(price + freight_value) | `fact_order_items` |

---

# 📈 Visuals & Calculations

### 1. Funnel Conversion Chart  
**Type:** Sankey or funnel  
**Fields:**  
- Stage 1: MQL  
- Stage 2: Closed Deal  
- Stage 3: Order  
- Stage 4: Order Item  

**Calculated Fields:**  
- `MQL Count`  
- `Closed Deal Count`  
- `Order Count`  
- `Order Item Count`  
- `Stage Conversion %`

---

### 2. Delivery Performance Over Time  
**Type:** Line chart  
**X‑axis:** Month(order_purchase_ts)  
**Y‑axis:** AVG(delivery_days)

---

### 3. Seller Segment Performance  
**Type:** Bar chart  
**X‑axis:** business_segment  
**Y‑axis:** COUNT(closed deals)

---

### 4. Top Products by Revenue  
**Type:** Horizontal bar  
**X‑axis:** SUM(price + freight_value)  
**Y‑axis:** product_category_name  

---

# 🔗 Data Sources (Tableau Relationships)

- `fact_mqls` → `fact_closed_deals` (mql_id)  
- `fact_closed_deals` → `fact_orders` (seller_id = customer_id)  
- `fact_orders` → `fact_order_items` (order_id)  
- `fact_order_items` → `dim_products` (product_id)  

---

# 🎨 Design Notes

- Use consistent color coding for funnel stages  
- KPI cards should be large and high‑contrast  
- Use tooltips to show detailed metrics  
- Add filters for:  
  - Date range  
  - Seller segment  
  - Product category  
  - State/City  

---

# 📄 Deliverables

- Tableau workbook (.twb or .twbx)  
- Published dashboard on Tableau Server/Cloud  
- Linked exposure in dbt docs  


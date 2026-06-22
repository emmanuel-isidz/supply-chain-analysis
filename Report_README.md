# 🚚 Supply Chain Performance Analysis using SQL

<div align="center">

### Transforming Supply Chain Data into Actionable Business Insights

**End-to-End SQL Analytics Project**

Analyzing delivery performance, order fulfillment, OTIF compliance, customer service levels, and operational efficiency to support data-driven supply chain decisions.

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Analytics](https://img.shields.io/badge/Data-Analytics-success)
![Supply Chain](https://img.shields.io/badge/Domain-Supply%20Chain-orange)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

</div>

---

## 📖 Project Overview

Supply chain organizations generate vast amounts of operational data every day. However, without proper analysis, identifying delivery bottlenecks, fulfillment challenges, and customer service issues can be difficult.

This project leverages **SQL** to analyze supply chain operations and uncover actionable insights related to:

- Delivery performance
- OTIF compliance
- Customer service levels
- Product performance
- Order trends
- Operational efficiency

The goal is to transform raw transactional data into meaningful business intelligence that supports better decision-making.

---

## 🎯 Business Problem

Late deliveries and incomplete shipments negatively impact:

- Customer satisfaction
- Service-level agreements (SLAs)
- Operational efficiency
- Revenue growth

The business needed answers to critical questions such as:

- Are orders being delivered on time?
- Which customers are underperforming?
- Which product categories perform best?
- When are operational workloads highest?
- Where are service-level failures occurring?

---

## 🗂 Dataset Overview

The analysis was conducted using six relational tables.

| Table | Description |
|---------|-------------|
| Customers | Customer information and locations |
| Products | Product details and categories |
| Calendar | Date dimension table |
| Targets | Customer OTIF targets |
| Orders | Detailed transactional orders |
| Orders Aggregate | Aggregated operational metrics |

---

## 🛠 Tools Used

| Tool | Purpose |
|--------|---------|
| MySQL | Data Cleaning & Analysis |
| SQL | Querying & KPI Development |
| Excel | Data Validation |
| Power BI | Dashboarding (Optional) |
| GitHub | Project Documentation |

---

## 📊 Key KPIs

### OTIF (On-Time In-Full)

Measures orders delivered:

- On or before the agreed delivery date
- In full quantity

```sql
OTIF = (OTIF Orders / Total Orders) * 100
```

### Delivery Delay

Measures delivery performance against agreed timelines.

```sql
Delivery Delay = Actual Delivery Date - Agreed Delivery Date
```

### Fulfillment Rate

Measures the percentage of orders delivered completely.

---

# 🔍 Analysis Performed

## 1. Monthly Order Trends

Analyzed order volumes by month to identify demand patterns and seasonality.

### Business Value

- Demand forecasting
- Inventory planning
- Workforce optimization

---

## 2. Weekly Trend of Late Deliveries

Measured weekly delivery delays to identify operational bottlenecks.

### Business Value

- Transportation planning
- Warehouse efficiency improvement
- Service-level monitoring

---

## 3. Month with Highest Incomplete Deliveries

### Key Finding

📌 **August recorded the highest number of orders not delivered in full.**

### Business Impact

- Customer dissatisfaction
- Increased operational costs
- Lower OTIF performance

---

## 4. Delivery Delay Analysis

Calculated the difference between actual and agreed delivery dates for every order.

### Business Value

Provides visibility into delivery reliability and logistics performance.

---

## 5. OTIF Performance by City

Compared service levels across customer locations.

### Business Value

- Regional performance monitoring
- Service-level optimization
- Customer experience improvement

---

## 6. Total Late Deliveries

Measured the number of orders delivered after their agreed delivery date.

### Business Value

Tracks operational efficiency and logistics effectiveness.

---

## 7. Product Category Analysis

Calculated the number of unique products within each category.

### Business Value

- Product portfolio analysis
- Inventory optimization
- Category management

---

## 8. Busiest Operational Week

### Key Finding

📌 **Week 30 recorded the highest order volume.**

### Business Impact

Higher workload on:

- Warehouses
- Transportation teams
- Inventory systems

---

## 9. OTIF Performance by Product Category

Evaluated service-level performance across product categories.

### Business Value

Identifies best-performing and underperforming product groups.

---

## 10. Overall OTIF Performance

Calculated the percentage of orders that met OTIF criteria.

### Business Value

Provides a direct measure of customer service performance.

---

## 11. Weekend vs Weekday Orders

Compared order placement behavior between weekdays and weekends.

### Business Value

Supports workforce and capacity planning.

---

## 12. On-Time but Not In-Full Deliveries

Identified orders delivered on time but with incomplete quantities.

### Business Insight

Highlights:

- Inventory shortages
- Fulfillment issues
- Warehouse process inefficiencies

---

## 13. Highest Demand Product Category

Measured total order quantity by category.

### Business Value

Supports:

- Procurement planning
- Inventory allocation
- Demand forecasting

---

## 14. Customer Performance Against Targets

Compared customer OTIF performance against target benchmarks.

Customers were categorized as:

- 🟢 On Target
- 🔴 Underperforming

### Business Value

- SLA monitoring
- Customer retention
- Performance management

---

# 📈 Key Insights

### Operational Findings

✅ August experienced the highest number of incomplete deliveries.

✅ Week 30 was the busiest operational period.

✅ OTIF performance varied significantly across cities.

✅ Certain product categories consistently outperformed others.

✅ Several customers failed to meet agreed OTIF targets.

✅ Inventory and fulfillment issues contributed to incomplete deliveries.

✅ Delivery delays remain a major improvement opportunity.

---

# 💡 Recommendations

## Short-Term

- Investigate fulfillment issues observed in August.
- Reduce causes of late deliveries.
- Monitor underperforming customers monthly.
- Improve inventory availability for high-demand products.

---

## Medium-Term

- Implement OTIF monitoring dashboards.
- Improve warehouse picking accuracy.
- Enhance demand forecasting.
- Strengthen supplier collaboration.

---

## Long-Term

- Build predictive models for delivery delays.
- Forecast inventory shortages proactively.
- Develop customer-level OTIF scorecards.
- Automate supply chain performance monitoring.

---

# 📊 Suggested Power BI Dashboard

## Executive Dashboard

- Total Orders
- OTIF %
- Late Deliveries
- Incomplete Deliveries
- Top Customers

## Operations Dashboard

- Weekly Delivery Trends
- Monthly Order Trends
- OTIF by City
- OTIF by Product Category

## Customer Dashboard

- Customer OTIF Performance
- Target vs Actual OTIF
- Underperforming Customers

---

# 🧠 Skills Demonstrated

### SQL

- Data Cleaning
- Data Transformation
- Joins
- Aggregations
- Date Functions
- KPI Development
- Conditional Logic
- Performance Analysis

### Analytics

- Supply Chain Analytics
- OTIF Analysis
- Customer Performance Analysis
- Root Cause Investigation
- Data Storytelling
- Business Intelligence Reporting

---

# 🚀 Project Outcome

This project demonstrates how SQL can be used to transform raw supply chain data into meaningful business insights.

Through data cleaning, KPI development, and performance analysis, the project provides actionable recommendations that can help improve customer satisfaction, fulfillment efficiency, and overall supply chain effectiveness.

---

## 👨‍💻 Author

**Emmanuel Isidahomhen**

Aspiring Data Analyst | Marketing Analytics Enthusiast | SQL • Power BI • Excel • Python

### Connect With Me

- LinkedIn: *Add your LinkedIn URL*
- GitHub: *Add your GitHub URL*

---

⭐ If you found this project interesting, consider giving the repository a star.

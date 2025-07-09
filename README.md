# 📦 Supply Chain Analysis with SQL

This project demonstrates how SQL can be used to perform in-depth analysis of a supply chain system. Using real-world-inspired datasets that simulate product orders, inventory, suppliers, and delivery performance, this project aims to uncover inefficiencies, identify trends, and improve supply chain decision-making through structured query analysis.

---

## 🚀 Project Objectives

- Analyze **order fulfillment rates** across various time periods.
- Identify **supplier reliability** based on delivery timelines.
- Calculate **lead times** and **order delays**.
- Provide actionable **KPIs** to support supply chain optimization.
- calculate total orders received and grouped them by fulfilment rates  to show the percentages

---

## 🗂️ Dataset Overview

The analysis is based on the following simulated tables:

- `orders` – customer orders, order date, fulfillment date.
- `products` – product details including category and cost.
- `calendar` – a calenadr table that includes weeks,months and days.
- `targets` – this contains customer id and required targets.
- `customers` – customer details including customer id and customer name.

> Note: All data is mock-generated and sanitized for learning purposes.

---

## 🛠️ Tools & Technologies

- **MySQL 8+**
- SQL Functions: `JOIN`, `CTE`, `CASE`, `GROUP BY`, `DATE functions`, `WINDOW FUNCTIONS`
- Visualization suggestions (optional): Power BI / Tableau (not included in repo)

---

## 📊 Key SQL Features Demonstrated

- Aggregation & time-based analysis
- Common Table Expressions (CTEs) for modular queries
- Conditional logic with `CASE` statements
- Performance metrics like OTIF (On Time In Full) and fill rates

---

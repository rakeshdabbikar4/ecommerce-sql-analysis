# 📊 E-commerce SQL Analysis Project

This project performs a complete **end-to-end SQL analysis** on an E-commerce dataset using **SQLite**.  
It covers business KPIs, customer behavior, product performance, and advanced SQL concepts such as **CTEs**, **Window Functions**, **Ranking**, and aggregations.

The project is organized into separate folders for data, outputs, screenshots, and SQL queries for clear structure and professional presentation.

---

## 📁 Project Structure

ecommerce-sql-analysis/

│

├── data/ → Raw CSV files

├── outputs/ → Exported CSV outputs from SQL queries

├── screens/ → Screenshots of SQL results

├── sql/ → queries.sql containing 20 SQL queries

└── README.md → Project documentation

---

## 📦 Dataset Description

This project uses **4 CSV files** stored in the `data/` directory:

| File | Description |
|------|-------------|
| **customers.csv** | Customer details (ID, name, gender, age, city, signup date) |
| **products.csv** | Product information (ID, name, category, brand, price) |
| **orders.csv** | Order-level data (ID, customer ID, date, payment method) |
| **order_items.csv** | Line items (order ID, product ID, quantity, total price) |

---

## 🧠 Business Questions Answered

✔ What is the total revenue?  
✔ What is the average order value (AOV)?  
✔ Who are the top customers?  
✔ What are the best-selling products?  
✔ Which categories generate most revenue?  
✔ What are monthly revenue trends?  
✔ How many repeat customers?  
✔ Customer Lifetime Value (LTV)?  
✔ Ranking products using window functions?  
✔ Top 3 products per category?  

---

## 🧰 SQL Concepts Used

- Joins (INNER, LEFT)  
- Aggregations (SUM, COUNT, AVG)  
- Window Functions (RANK, DENSE_RANK)  
- CTEs (Common Table Expressions)  
- Date Functions  
- Group By & Order By  
- Subqueries  

All queries are located in:
sql/queries.sql

---

## 📈 Screenshots

All screenshots of SQL output are stored in: 
screens/


---

## 📂 Outputs (CSV)

All CSV outputs exported from DB Browser are stored in: 
outputs/


---

## 📌 CSV + Screenshot Mapping (All 20 Queries)

| Query | Description | CSV Output | Screenshot |
|-------|-------------|------------|------------|
| Q1 | Total orders | `outputs/q01_total_orders.csv` | `screens/q01_total_orders.png` |
| Q2 | Active customers | `outputs/q02_active_customers.csv` | `screens/q02_active_customers.png` |
| Q3 | Total revenue | `outputs/q03_total_revenue.csv` | `screens/q03_total_revenue.png` |
| Q4 | Average Order Value | `outputs/q04_aov.csv` | `screens/q04_aov.png` |
| Q5 | Top 10 products | `outputs/q05_top_products.csv` | `screens/q05_top_products.png` |
| Q6 | Top 10 customers | `outputs/q06_top_customers.csv` | `screens/q06_top_customers.png` |
| Q7 | Orders per month | `outputs/q07_orders_per_month.csv` | `screens/q07_orders_per_month.png` |
| Q8 | Revenue by category | `outputs/q08_category_revenue.csv` | `screens/q08_category_revenue.png` |
| Q9 | Repeat customers | `outputs/q09_repeat_customers.csv` | `screens/q09_repeat_customers.png` |
| Q10 | Highest order value | `outputs/q10_highest_order.csv` | `screens/q10_highest_order.png` |
| Q11 | Best-selling category | `outputs/q11_best_category.csv` | `screens/q11_best_category.png` |
| Q12 | Monthly revenue | `outputs/q12_monthly_revenue.csv` | `screens/q12_monthly_revenue.png` |
| Q13 | Returning customer % | `outputs/q13_returning_pct.csv` | `screens/q13_returning_pct.png` |
| Q14 | Product ranking (RANK) | `outputs/q14_rank_products.csv` | `screens/q14_rank_products.png` |
| Q15 | Category % revenue | `outputs/q15_category_pct.csv` | `screens/q15_category_pct.png` |
| Q16 | Orders per customer | `outputs/q16_orders_per_customer.csv` | `screens/q16_orders_per_customer.png` |
| Q17 | Above avg revenue products | `outputs/q17_products_above_avg.csv` | `screens/q17_products_above_avg.png` |
| Q18 | Top 3 per category | `outputs/q18_top3_per_category.csv` | `screens/q18_top3_per_category.png` |
| Q19 | Customer Lifetime Value | `outputs/q19_ltv.csv` | `screens/q19_ltv.png` |
| Q20 | KPI Summary | `outputs/q20_summary.csv` | `screens/q20_summary.png` |

---

## ▶️ How to Run This Project

### **1. Install DB Browser for SQLite**
Download: https://sqlitebrowser.org/

### **2. Create a new database**
ecommerce.db

### **3. Import CSV files**
Go to:
File → Import → Table from CSV

Import all 4 CSVs.

### **4. Run the queries**
Open:
sql/queries.sql

Run each query inside **Execute SQL**.

### **5. Export results**
Use:
Right-click → Export → CSV

Save in `outputs/`.

Save screenshots in `screens/`.

---

## 📄 Resume Bullet Points

**E-commerce SQL Analytics — SQLite**

- Built a complete SQL analytics project with **20+ business queries**.  
- Calculated KPIs, LTV, customer segmentation, category revenue, product performance, and trends.  
- Used advanced SQL: **CTEs, Window Functions, RANK, DENSE_RANK**, joins, aggregations.  
- Structured project with clean folders: data, outputs, screenshots, SQL scripts.  

---

## 👤 Author

**Rakesh D.**  
Aspiring Data Analyst  
Skills: SQL | Power BI | Python | Excel  


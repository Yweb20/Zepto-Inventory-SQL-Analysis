🛒 Zepto Inventory SQL Data Analysis Project (MySQL Version)

📌 Overview

This project presents a professional SQL-based analysis of a Zepto-style e-commerce inventory dataset, built to simulate real-world data analyst workflows in the retail and quick-commerce domain.

The analysis covers data exploration, data cleaning, and business-focused SQL queries to uncover insights related to pricing, discounts, inventory availability, revenue potential, and product packaging. The project emphasizes clarity, structured thinking, and decision-oriented analysis using MySQL.


---

📁 Dataset

Source: Retail inventory dataset (Zepto-style, sourced from Kaggle)

Kaggle Link: https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset

Records: ~3,900 product records

Granularity: Each row represents a unique product SKU


Duplicate product names exist because the same product can appear across different:

Weights

Package sizes

Discount levels


This structure closely reflects real-world e-commerce catalog data.

🧾 Schema & Columns

> Column names were standardized and renamed where necessary to improve clarity and maintain database best practices (for example, id was renamed to sku_id).



Column Name	Description

sku_id	Unique identifier for each product SKU
name	Product name
category	Product category
mrp	Maximum Retail Price (₹)
discount_percent	Discount applied on MRP
discounted_selling_price	Final selling price after discount (₹)
available_quantity	Units available in inventory
weight_in_gms	Product weight in grams
out_of_stock	Stock availability flag
quantity	Units per package



---

🛠 Tools & Technologies

MySQL – Relational database and SQL analysis

CSV Import – Direct ingestion of raw dataset

SQL – Data exploration, cleaning, and analytical querying

GitHub – Version control and project documentation



---

🔄 Project Steps

1️⃣ Data Import

Imported the CSV file directly into MySQL as table zepto_v2

Verified schema, data types, and record counts



---

2️⃣ Data Exploration (EDA)

Performed initial exploration to understand data quality and structure:

Total record count validation

Sample data inspection

Null value checks across all columns

Identification of distinct product categories

In-stock vs out-of-stock product distribution

Detection of products appearing multiple times (multiple SKUs)



---

3️⃣ Data Cleaning

Improved data reliability and usability by:

Identifying and removing products with zero MRP or selling price

Standardizing column names for readability

Converting price values from paise to rupees



---

4️⃣ Business Analysis (SQL)

Answered key business questions using structured SQL queries:

🔝 Top 10 best-value products based on discount percentage

❌ High-MRP products that are currently out of stock

💰 Estimated potential revenue by product category

🏷 Premium products (MRP > ₹500) with minimal discounts

📊 Top categories offering the highest average discounts

⚖ Price-per-gram analysis to identify value-for-money products

📦 Product grouping by weight (Low / Medium / Bulk)

🧮 Total inventory weight by category


All queries are designed to reflect real analyst decision-making scenarios.


---

📊 Key Results & Insights

A small number of categories contribute disproportionately to overall revenue

Higher discounts do not always correlate with better stock availability

Premium-priced products often follow different discount strategies

Price-per-gram analysis reveals hidden value opportunities across categories

Inventory weight distribution varies significantly, impacting storage and logistics considerations



---

▶ How to Run the Project

1. Clone the repository



git clone <your-repo-link>

2. Import the CSV file into MySQL as table zepto_v2


3. Open the SQL file and execute queries in the following order:



Data exploration

Data cleaning

Business analysis


4. Review results using MySQL Workbench or any compatible SQL client

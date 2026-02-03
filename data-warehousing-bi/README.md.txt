# Data Warehousing for Business Intelligence (Adidas Case Study)

## 📌 Overview
This project focuses on the design and implementation of a Data Warehouse and Business Intelligence (BI) system to support data-driven decision making using an Adidas business case.

The system integrates multiple operational data sources into a centralized OLAP data warehouse, enabling advanced analytics on sales performance, customer behavior, inventory trends, and staff productivity through interactive BI dashboards.

---

## 🏢 Business Context
Company Adidas  
Industry Sportswear & Retail  

### Key Business Problems
- Lack of integrated data across sales, customers, products, and staff
- Limited visibility into sales performance by product, region, and retailer
- Difficulty evaluating staff productivity and customer loyalty
- Inefficient reporting and decision-making processes

---

## 🎯 Project Objectives
- Design a centralized Data Warehouse for business intelligence
- Transform OLTP data into OLAP star schemas
- Enable interactive analytics and visualization
- Support strategic decisions on sales, inventory, and workforce management

---

## 🗂 Data Sources
- Adidas Webstore Product Data (Kaggle)
- Adidas Sales & Retail Data (LinkedIn Article)
- Synthetic Data (Customer, Staff, Store, Purchase)  
   Generated due to privacy and data availability constraints

---

## 🏗 Data Architecture

### OLTP Design
- Normalized relational schema
- Core entities Product, Retailer, Customer, Staff, Purchase

### OLAP Design (Star Schema)
The data warehouse consists of three main fact tables

#### 1️⃣ PurchaseFact – Customer Purchase Behavior
- Tracks who bought what, where, and when
- Supports customer segmentation and sales trend analysis

#### 2️⃣ BestSellingFact – Product Performance
- Identifies top-selling products by quantity and revenue
- Supports demand forecasting and inventory optimization

#### 3️⃣ StaffPerformanceFact – Staff Productivity
- Measures staff transactions, revenue contribution, and average sales
- Supports workforce evaluation and incentive planning

Dimensions
- DateDim
- ProductDim
- CustomerDim
- RetailerDim
- StaffDim

---

## 🔄 ETL Process

### Tool Tableau Prep

Extract
- Loaded OLTP tables from CSV  database sources

Transform
- Data cleaning and formatting
- Deduplication of dimension tables
- Date dimension extraction from transaction dates
- Aggregation for fact tables

Load
- Loaded transformed data into OLAP schema  
- Target database MySQL  PostgreSQL (Star Schema)

---

## 📊 Business Intelligence & Analytics

### Visualizations (Tableau Desktop)
- Staff Performance Analysis (Bar Charts)
- Sales Volume by Region (Maps)
- Customer Loyalty KPIs
- Best-Selling Product Analysis (Scatter Plot)
- Time Series & Forecasting (Staff Performance)
- Interactive Dashboard & Story

These dashboards enable stakeholders to explore data beyond static reports and gain actionable insights.

---

## 🛠 Tools & Technologies
- SQL, Data Modeling
- Tableau Prep (ETL)
- Tableau Desktop (BI & Visualization)
- MySQL  PostgreSQL
- OLTP & OLAP Design
- Star Schema, Fact & Dimension Modeling

---

## 📈 Key Outcomes
- Centralized and structured data for analytics
- Improved visibility into sales, staff, and customer behavior
- Faster and more accurate decision-making
- Scalable BI-ready data architecture

---

## 📽 Demo
🎥 Video demonstration of ETL and BI dashboards  
httpsdrive.google.comfiled1VJBcvVfgSDJePbx2HRJ66bZfEuD8xP0gview

---

## 📄 Notes
- Real business data was partially replaced with synthetic data due to privacy constraints
- This project was completed as part of ITCS453 – Data Warehousing and Data Mining

---

## 👤 Author
Suppakorn Pojsomphong  
Faculty of Information and Communication Technology  
Mahidol University

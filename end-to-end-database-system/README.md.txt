# End-to-End Database System Development  
## Restaurant Management Database System

## 📌 Overview
This project presents an **end-to-end relational database system** designed for a
**restaurant management scenario**, covering the full workflow from
**conceptual design to physical implementation**.

The system supports core restaurant operations including **orders, menus, customers,
staff, promotions, inventory, and suppliers**, with strong emphasis on
**data integrity, normalization, and relational consistency**.

---

## 🎯 Objectives
- Design a complete relational database from business requirements
- Apply normalization up to **Third Normal Form (3NF)**
- Implement constraints to ensure data integrity
- Support transactional operations and reporting queries
- Prepare a scalable foundation for backend application integration

---

## 🗂 Database Scope
The database covers the following functional areas:
- Customer management
- Orders and payments
- Menu and ingredients
- Staff and role specialization
- Promotions and discounts
- Inventory and supplier management

---

## 🧩 Database Design

### 🔹 Conceptual Design
- ER Diagram defining entities, attributes, and relationships
- Clear cardinality and participation constraints
- Staff specialization using subclass modeling  
  (Chef, Waiter, General Manager, Stock Controller)

---

### 🔹 Logical Design & Normalization
- Converted ER model into relational schema
- Normalized to **1NF, 2NF, and 3NF**
- Eliminated redundancy, partial dependencies, and transitive dependencies
- Final schema remains stable after normalization

---

### 🔹 Physical Design & Implementation
- Implemented using **SQL**
- Defined constraints:
  - PRIMARY KEY
  - FOREIGN KEY
  - NOT NULL
  - UNIQUE
  - CHECK
- Created indexes for efficient query execution
- Inserted large-scale synthetic data for testing

---

## 🛠 Technologies Used
- **DBMS**: MySQL
- **Language**: SQL
- **Data Generation**: Faker (CSV → SQL)
- **Design Tools**: ER Modeling & Schema Diagrams

---

## 🔎 Key Entities
- Customer, Order, Payment, Menu, Promotion
- Staff (with role-based subclasses)
- Ingredient, Supplier, Inventory
- Relationship tables (Consist, Apply, Use, MadeUpOf, Contact)

---

## 📈 Key Outcomes
- Fully normalized relational database (3NF)
- Enforced referential integrity across all entities
- Reliable transactional structure for restaurant operations
- Clear separation of concerns between business domains
- Ready for backend or API integration

---

## ⚠ Limitations
- No application-layer integration
- Credentials not secured for production use
- No stored procedures or triggers
- Performance testing limited to academic scale

---

## 🚀 Future Improvements
- Add stored procedures and triggers
- Implement role-based access control
- Integrate with backend services (API)
- Extend system for analytics and reporting (OLAP)
- Optimize indexing for large-scale deployment

---

## 📚 Course Information
Developed as part of  
**ITCS413 – Database Design**  
Faculty of Information and Communication Technology  
Mahidol University

---

## 👤 Author
**Suppakorn Pojsomphong**  
B.Sc. in Information and Communication Technology  
Mahidol University

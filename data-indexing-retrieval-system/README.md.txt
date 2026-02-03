# Data Indexing & Retrieval System  
## Sanrio Character Search Engine (Prototype IR System)

## 📌 Overview
This project is a **prototype Information Retrieval (IR) system** designed to provide a
dedicated search engine for **Sanrio characters**.

The system addresses limitations of existing platforms by offering **structured data indexing,
advanced search capabilities, partial matching, and relevance-based ranking**, enabling users to
quickly discover detailed character information through an intuitive web interface.

---

## 🎯 Problem Statement
Existing sources for Sanrio character information suffer from:
- Scattered and incomplete data across multiple websites
- Limited search functionality (no partial match, ranking, or advanced queries)
- No filtering or relevance-based ranking
- Poor support for keyword-based and multi-attribute searches

This project aims to solve these issues by building a **custom search engine** optimized for
character discovery.

---

## 🗂 Dataset
- **223 Sanrio characters**
- Data collected from:
  - Hello Kitty Wiki
  - Blippo
- Attributes include:
  - Character name
  - Description
  - Debut year
  - Creator
  - Species
  - Gender
  - Image URL

📌 Data was initially collected in **CSV format** and normalized into **JSON** using Python
before indexing.

---

## 🏗 System Architecture
**Pipeline Overview**:
1. Data collection from external sources
2. Data normalization (CSV → JSON)
3. Indexing and inverted index creation in **Elasticsearch**
4. Query processing and ranking
5. Result retrieval via **Flask API**
6. Visualization and monitoring using **Kibana**

---

## 🔎 Search Features
- **Single-word search**
- **Multi-word queries**
- **Partial matching**
- **Relevance-based ranking** using Elasticsearch scoring
- Keyword matching across character names and descriptions

---

## 🛠 Tools & Technologies
- **Python** – Data processing and backend logic
- **Elasticsearch** – Indexing, inverted index, ranking, and retrieval
- **Flask** – Web application and API layer
- **Kibana** – Index monitoring and query analytics
- **JSON / CSV** – Data storage and preprocessing

---

## 📸 System Demonstration
The system supports:
- Keyword-based search
- Ranked result lists based on relevance score
- Character detail pages with images and metadata

*(Screenshots and search session examples are included in this repository)*

---

## ⚠ Limitations
- No autocomplete or search suggestions
- Image URLs are not validated before rendering
- Sensitive credentials are hard-coded (not production-ready)
- No caching for frequent queries
- Limited input normalization (case sensitivity, punctuation)

---

## 🚀 Future Improvements
- Implement autocomplete and query suggestions
- Improve image validation and fallback handling
- Secure credential management using environment variables
- Add caching to improve query performance
- Enhance UI/UX and add filters and sorting
- Optimize indexing strategy for larger datasets

---

## 📚 Lessons Learned
- Practical understanding of **search engine internals**
- Hands-on experience with **Elasticsearch indexing and scoring**
- Designing retrieval systems for real-world datasets
- Integrating backend search services with web applications

---

## 📄 Course Information
This project was completed as part of  
**ITCS414 – Information Retrieval and Storage**  
Faculty of Information and Communication Technology  
Mahidol University

---

## 👤 Author
**Suppakorn Pojsomphong**  
B.Sc. in Information and Communication Technology  
Mahidol University

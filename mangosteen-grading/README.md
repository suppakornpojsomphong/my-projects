# 🥭 Mangosteen Grading System  
**AI-Driven Automated Mangosteen Quality Assessment**

This senior project proposes an **artificial intelligence–based framework** for automated mangosteen (Garcinia mangostana) grading, aiming to improve **objectivity, consistency, and efficiency** in post-harvest quality control for Thailand’s export industry.

---

## 🎓 Project Information

- **Program**: B.Sc. in Information and Communication Technology (International Program)  
- **Institution**: Mahidol University  
- **Advisor**: Assoc. Prof. Dr. Worapan Kusakunniran  
- **Project Type**: Senior Project  
- **Duration**: Nov 2024 – May 2026 (Expected)

---

## 📌 Project Objectives

The system is designed around **three integrated objectives**:

### **Objective 1: Size Estimation (Completed ✅)**
- Developed an **image-based size estimation pipeline** using **YOLOv11 instance segmentation**.
- Accurately segments the **fruit body** and a **calibrated reference sticker**.
- Applied **geometric approximation methods**:
  - Circle fitting
  - Direct perimeter calculation
- Estimated **physical dimensions** (diameter and circumference).
- Classified mangosteens into **standardized size codes (1–5)**.

---

### **Objective 2: Appearance-Based Classification (In Progress 🔄)**
- Developing a **multi-view CNN architecture with expert-knowledge fusion**.
- Uses **sticker-free multi-view images**:
  - Top view
  - Bottom view
  - Four side views
- Evaluates visual attributes such as:
  - Peel texture
  - Blemishes
  - Color uniformity
- Outputs **commercial quality grades**:
  - A, B, C, D
  - Unripe grade (G)

---

### **Objective 3: Final Quality Integration (In Progress 🔄)**
- Integrates **size codes** and **appearance grades**.
- Produces a unified final quality label  
  *(e.g., A1, B3, C4)* for practical industrial use.

---

## 🧠 System Overview

The proposed framework consists of:
1. **Instance segmentation** for precise fruit and reference detection.
2. **Geometric computation** for reliable physical size estimation.
3. **Multi-view deep learning classification** for appearance assessment.
4. **Decision-level fusion** for final quality grading.

This design enables a **scalable and standardized grading pipeline** while significantly reducing human subjectivity.

---

## 🛠 Technologies Used

- **Programming**: Python  
- **Computer Vision**: OpenCV  
- **Deep Learning**: TensorFlow / Keras  
- **Object Detection & Segmentation**: YOLOv11  
- **Data Processing & Visualization**: NumPy, Matplotlib  

---

## 📊 Current Status

- ✅ Objective 1: Completed  
- 🔄 Objective 2: In progress  
- 🔄 Objective 3: In progress  
- 🗓 **Expected completion**: May 2026  

---

## 🚀 Expected Impact

- Provides a **reliable and objective mangosteen grading system**.
- Enhances **operational efficiency** in post-harvest quality control.
- Supports Thailand’s competitiveness in the **tropical fruit export market**.

---

## 📖 Keywords

Mangosteen Grading · Computer Vision · Deep Learning · Instance Segmentation · YOLOv11 · Multi-View Classification · Automated Quality Control

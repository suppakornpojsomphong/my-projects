# Face Authentication System (Secure Login with Facial Recognition)
## 📌 Project Overview
This project implements a secure face authentication system using deep learning and computer vision. It employs a CNN-based model for facial feature extraction and cosine similarity for verification.

## 🏆 Key Features
- Deep Learning-based Face Recognition using TensorFlow/Keras.
- Cosine Similarity for Identity Matching.
- Secure Password Handling with bcrypt.

## SQL Injection Prevention using prepared statements.
- Real-time Face Detection using OpenCV.

## 🔧 Technologies Used
- Python
- TensorFlow/Keras
- OpenCV (Face detection & preprocessing)
- MySQL (User authentication storage)

## Important Files
- face_auth_db.sql: SQL script for setting up the authentication database.
- training.ipynb: Jupyter Notebook for training the facial recognition model.
- Finish.ipynb: Jupyter Notebook for implementing the trained model in the authentication system.

## Installation & Usage
1. Clone this repository: git clone https://github.com/suppakornnote/Face_Authentication_System.git
2. Set up the database: mysql -u root -p < face_auth_db.sql
3. Train the model: jupyter notebook training.ipynb
4. Implement the solution: jupyter notebook Finish.ipynb
5. Run the authentication system: python app.py

CREATE DATABASE face_auth_db;
use `face_auth_db`;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    face_embedding BLOB NOT NULL
);



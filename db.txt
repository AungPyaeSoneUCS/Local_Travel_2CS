-- Drop the database if it already exists
DROP DATABASE IF EXISTS tourly;
CREATE DATABASE tourly;
USE tourly;

-- =========================
-- Admin table
-- =========================
CREATE TABLE admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    phone VARCHAR(20)
);

-- Insert sample admin
INSERT INTO admin (username, password, email, phone) VALUES
('admin', 'admin123', 'admin@tourly.com', '09123456789');

-- =========================
-- Users table
-- =========================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    role ENUM('user', 'admin') DEFAULT 'user'
);

-- Insert sample users
INSERT INTO users (name, email, password, phone, role) VALUES
('AungPyaeSone', 'aungpyaesone@ucsh.edu.mm', 'APS@2025', '09979737123', 'user'),
('Min Zayar', 'minzayar@gmail.com', 'MZYA@2025', '09671924363', 'user');

-- =========================
-- Packages table
-- =========================
CREATE TABLE packages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    packageName VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(12,2) NOT NULL,
    duration VARCHAR(50)
);

-- Insert sample packages
INSERT INTO packages (packageName, description, price, duration) VALUES
('Bagan Ancient Temples', 'Explore the historic temples of Bagan', 500000.00, '3 Days'),
('Inle Lake Experience', 'Boat tours and floating villages', 350000.00, '2 Days'),
('Ngapali Beach Getaway', 'Relax at the most beautiful beach in Myanmar', 600000.00, '4 Days'),
('Chaung Tha', 'Seaside resort experience', 600000.00, '3 Days'),
('Hpa-an Adventure', 'Caves, mountains, and river landscapes', 1400000.00, '5 Days');

-- =========================
-- Bookings table
-- =========================
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    packageId INT NOT NULL,
    travelDate DATE NOT NULL,
    people INT NOT NULL,
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (userId) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (packageId) REFERENCES packages(id) ON DELETE CASCADE
);

-- Insert sample bookings
INSERT INTO bookings (userId, packageId, travelDate, people, status) VALUES
(1, 1, '2025-09-02', 3, 'Approved'),
(1, 2, '2025-09-30', 2, 'Pending'),
(1, 3, '2025-09-16', 3, 'Approved'),
(2, 1, '2025-10-01', 2, 'Approved'),
(2, 2, '2025-10-02', 2, 'Pending'),
(2, 2, '2025-10-02', 2, 'Pending'),
(2, 4, '2025-10-03', 3, 'Pending'),
(2, 3, '2025-09-23', 5, 'Approved'),
(2, 5, '2025-09-27', 8, 'Pending'),
(2, 3, '2025-10-02', 5, 'Pending');

-- =========================
-- Inquiries table
-- =========================
CREATE TABLE inquiries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample inquiries
INSERT INTO inquiries (name, email, message) VALUES
('Traveler One', 'traveler1@gmail.com', 'I want to know more about the Inle Lake package.'),
('Traveler Two', 'traveler2@yahoo.com', 'Can I book for 10 people at once?');

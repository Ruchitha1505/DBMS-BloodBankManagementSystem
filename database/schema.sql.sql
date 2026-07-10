/*=========================================================
   Blood Bank Management System
   Database Schema
   Author : Ruchitha M
=========================================================*/

DROP DATABASE IF EXISTS BloodBankManagementSystem;

CREATE DATABASE BloodBankManagementSystem;

USE BloodBankManagementSystem;

----------------------------------------------------------
-- Donor Table
----------------------------------------------------------

CREATE TABLE Donor
(
    DonorID INT AUTO_INCREMENT PRIMARY KEY,
    DonorName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Age INT NOT NULL,
    BloodGroup VARCHAR(5) NOT NULL,
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100),
    Address VARCHAR(200),
    City VARCHAR(50),
    LastDonationDate DATE
);

----------------------------------------------------------
-- Patient Table
----------------------------------------------------------

CREATE TABLE Patient
(
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    Age INT,
    BloodGroup VARCHAR(5),
    Phone VARCHAR(15),
    Address VARCHAR(200),
    City VARCHAR(50)
);

----------------------------------------------------------
-- Blood Stock Table
----------------------------------------------------------

CREATE TABLE BloodStock
(
    BloodGroup VARCHAR(5) PRIMARY KEY,
    Quantity INT NOT NULL
);

----------------------------------------------------------
-- Donation Table
----------------------------------------------------------

CREATE TABLE Donation
(
    DonationID INT AUTO_INCREMENT PRIMARY KEY,

    DonorID INT NOT NULL,

    BloodGroup VARCHAR(5),

    UnitsDonated INT NOT NULL,

    DonationDate DATE,

    FOREIGN KEY (DonorID)
    REFERENCES Donor(DonorID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY (BloodGroup)
    REFERENCES BloodStock(BloodGroup)
);

----------------------------------------------------------
-- Blood Request Table
----------------------------------------------------------

CREATE TABLE BloodRequest
(
    RequestID INT AUTO_INCREMENT PRIMARY KEY,

    PatientID INT NOT NULL,

    BloodGroup VARCHAR(5),

    UnitsRequested INT,

    RequestDate DATE,

    Status VARCHAR(20),

    FOREIGN KEY (PatientID)
    REFERENCES Patient(PatientID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY (BloodGroup)
    REFERENCES BloodStock(BloodGroup)
);

----------------------------------------------------------
-- Insert Initial Blood Stock
----------------------------------------------------------

INSERT INTO BloodStock VALUES
('A+',20),
('A-',10),
('B+',18),
('B-',8),
('AB+',12),
('AB-',5),
('O+',25),
('O-',10);

----------------------------------------------------------
-- End of schema.sql
----------------------------------------------------------
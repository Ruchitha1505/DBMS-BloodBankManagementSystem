/*=========================================================
   Blood Bank Management System
   views.sql
=========================================================*/

USE BloodBankManagementSystem;

----------------------------------------------------------
-- 1. Donor Details View
----------------------------------------------------------

CREATE OR REPLACE VIEW DonorDetails AS
SELECT
    DonorID,
    DonorName,
    Gender,
    Age,
    BloodGroup,
    City
FROM Donor;

----------------------------------------------------------
-- 2. Patient Details View
----------------------------------------------------------

CREATE OR REPLACE VIEW PatientDetails AS
SELECT
    PatientID,
    PatientName,
    Gender,
    Age,
    BloodGroup,
    City
FROM Patient;

----------------------------------------------------------
-- 3. Blood Stock View
----------------------------------------------------------

CREATE OR REPLACE VIEW BloodStockStatus AS
SELECT
    BloodGroup,
    Quantity
FROM BloodStock;

----------------------------------------------------------
-- 4. Donation History View
----------------------------------------------------------

CREATE OR REPLACE VIEW DonationHistory AS
SELECT
    d.DonationID,
    o.DonorName,
    d.BloodGroup,
    d.UnitsDonated,
    d.DonationDate
FROM Donation d
JOIN Donor o
ON d.DonorID = o.DonorID;

----------------------------------------------------------
-- 5. Blood Request View
----------------------------------------------------------

CREATE OR REPLACE VIEW BloodRequestDetails AS
SELECT
    r.RequestID,
    p.PatientName,
    r.BloodGroup,
    r.UnitsRequested,
    r.Status,
    r.RequestDate
FROM BloodRequest r
JOIN Patient p
ON r.PatientID = p.PatientID;

----------------------------------------------------------
-- 6. Approved Requests
----------------------------------------------------------

CREATE OR REPLACE VIEW ApprovedRequests AS
SELECT *
FROM BloodRequest
WHERE Status = 'Approved';

----------------------------------------------------------
-- 7. Pending Requests
----------------------------------------------------------

CREATE OR REPLACE VIEW PendingRequests AS
SELECT *
FROM BloodRequest
WHERE Status = 'Pending';

----------------------------------------------------------
-- 8. Low Blood Stock
----------------------------------------------------------

CREATE OR REPLACE VIEW LowBloodStock AS
SELECT *
FROM BloodStock
WHERE Quantity < 10;

----------------------------------------------------------
-- Test Views
----------------------------------------------------------

SELECT * FROM DonorDetails;
SELECT * FROM PatientDetails;
SELECT * FROM BloodStockStatus;
SELECT * FROM DonationHistory;
SELECT * FROM BloodRequestDetails;
SELECT * FROM ApprovedRequests;
SELECT * FROM PendingRequests;
SELECT * FROM LowBloodStock;

----------------------------------------------------------
-- End of views.sql
----------------------------------------------------------
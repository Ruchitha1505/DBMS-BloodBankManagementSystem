/*=========================================================
   Blood Bank Management System
   queries.sql
=========================================================*/

USE BloodBankManagementSystem;

----------------------------------------------------------
-- BASIC SELECT QUERIES
----------------------------------------------------------

-- 1. Display all donors
SELECT * FROM Donor;

-- 2. Display all patients
SELECT * FROM Patient;

-- 3. Display all blood stock
SELECT * FROM BloodStock;

-- 4. Display all donations
SELECT * FROM Donation;

-- 5. Display all blood requests
SELECT * FROM BloodRequest;

----------------------------------------------------------
-- FILTERING
----------------------------------------------------------

-- 6. Donors with O+ blood group
SELECT * FROM Donor
WHERE BloodGroup='O+';

-- 7. Female donors
SELECT * FROM Donor
WHERE Gender='Female';

-- 8. Patients older than 30
SELECT * FROM Patient
WHERE Age > 30;

-- 9. Blood stock less than 15 units
SELECT * FROM BloodStock
WHERE Quantity < 15;

-- 10. Pending blood requests
SELECT * FROM BloodRequest
WHERE Status='Pending';

----------------------------------------------------------
-- SORTING
----------------------------------------------------------

-- 11. Donors by name
SELECT * FROM Donor
ORDER BY DonorName;

-- 12. Patients by age
SELECT * FROM Patient
ORDER BY Age DESC;

----------------------------------------------------------
-- AGGREGATE FUNCTIONS
----------------------------------------------------------

-- 13. Total donors
SELECT COUNT(*) AS TotalDonors
FROM Donor;

-- 14. Total patients
SELECT COUNT(*) AS TotalPatients
FROM Patient;

-- 15. Total blood units
SELECT SUM(Quantity) AS TotalUnits
FROM BloodStock;

-- 16. Average blood stock
SELECT AVG(Quantity) AS AverageStock
FROM BloodStock;

-- 17. Maximum stock
SELECT MAX(Quantity) AS MaximumStock
FROM BloodStock;

-- 18. Minimum stock
SELECT MIN(Quantity) AS MinimumStock
FROM BloodStock;

----------------------------------------------------------
-- GROUP BY
----------------------------------------------------------

-- 19. Donors in each blood group
SELECT BloodGroup,
COUNT(*) AS TotalDonors
FROM Donor
GROUP BY BloodGroup;

-- 20. Patients in each blood group
SELECT BloodGroup,
COUNT(*) AS TotalPatients
FROM Patient
GROUP BY BloodGroup;

----------------------------------------------------------
-- HAVING
----------------------------------------------------------

-- 21. Blood groups having more than one donor
SELECT BloodGroup,
COUNT(*) AS Total
FROM Donor
GROUP BY BloodGroup
HAVING COUNT(*) > 1;

----------------------------------------------------------
-- JOINS
----------------------------------------------------------

-- 22. Donation details with donor name
SELECT
d.DonationID,
o.DonorName,
d.BloodGroup,
d.UnitsDonated,
d.DonationDate
FROM Donation d
JOIN Donor o
ON d.DonorID=o.DonorID;

-- 23. Blood request with patient name
SELECT
r.RequestID,
p.PatientName,
r.BloodGroup,
r.UnitsRequested,
r.Status
FROM BloodRequest r
JOIN Patient p
ON r.PatientID=p.PatientID;

----------------------------------------------------------
-- SEARCH
----------------------------------------------------------

-- 24. Search donor by city
SELECT *
FROM Donor
WHERE City='Bangalore';

-- 25. Search patient by city
SELECT *
FROM Patient
WHERE City='Bangalore';

----------------------------------------------------------
-- UPDATE
----------------------------------------------------------

-- 26. Increase O+ stock
UPDATE BloodStock
SET Quantity=Quantity+2
WHERE BloodGroup='O+';

-- 27. Decrease A+ stock
UPDATE BloodStock
SET Quantity=Quantity-1
WHERE BloodGroup='A+';

----------------------------------------------------------
-- DELETE
----------------------------------------------------------

-- 28. Delete rejected requests
DELETE FROM BloodRequest
WHERE Status='Rejected';

----------------------------------------------------------
-- SUBQUERIES
----------------------------------------------------------

-- 29. Donor(s) with maximum age
SELECT *
FROM Donor
WHERE Age=
(
SELECT MAX(Age)
FROM Donor
);

-- 30. Patient(s) with minimum age
SELECT *
FROM Patient
WHERE Age=
(
SELECT MIN(Age)
FROM Patient
);

----------------------------------------------------------
-- LIKE OPERATOR
----------------------------------------------------------

-- 31. Donors whose names start with A
SELECT *
FROM Donor
WHERE DonorName LIKE 'A%';

-- 32. Patients whose names end with A
SELECT *
FROM Patient
WHERE PatientName LIKE '%a';

----------------------------------------------------------
-- BETWEEN
----------------------------------------------------------

-- 33. Donors aged between 20 and 30
SELECT *
FROM Donor
WHERE Age BETWEEN 20 AND 30;

----------------------------------------------------------
-- DISTINCT
----------------------------------------------------------

-- 34. Distinct blood groups
SELECT DISTINCT BloodGroup
FROM Donor;

----------------------------------------------------------
-- IN
----------------------------------------------------------

-- 35. Donors with A+ or O+
SELECT *
FROM Donor
WHERE BloodGroup IN ('A+','O+');

----------------------------------------------------------
-- REPORTS
----------------------------------------------------------

-- 36. Approved requests
SELECT *
FROM BloodRequest
WHERE Status='Approved';

-- 37. Donation history
SELECT *
FROM Donation
ORDER BY DonationDate DESC;

-- 38. Blood stock report
SELECT *
FROM BloodStock
ORDER BY Quantity DESC;

----------------------------------------------------------
-- INNER JOIN REPORT
----------------------------------------------------------

-- 39. Complete donation report
SELECT
o.DonorName,
d.BloodGroup,
d.UnitsDonated,
d.DonationDate
FROM Donor o
INNER JOIN Donation d
ON o.DonorID=d.DonorID;

----------------------------------------------------------
-- FINAL REPORT
----------------------------------------------------------

-- 40. Complete blood request report
SELECT
p.PatientName,
r.BloodGroup,
r.UnitsRequested,
r.Status
FROM Patient p
INNER JOIN BloodRequest r
ON p.PatientID=r.PatientID;

----------------------------------------------------------
-- END OF FILE
----------------------------------------------------------
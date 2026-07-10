/*=========================================================
   Blood Bank Management System
   Sample Data
=========================================================*/

USE BloodBankManagementSystem;

----------------------------------------------------------
-- Insert Donors
----------------------------------------------------------

INSERT INTO Donor
(DonorName, Gender, Age, BloodGroup, Phone, Email, Address, City, LastDonationDate)
VALUES
('Rahul Kumar','Male',24,'A+','9876543210','rahul@gmail.com','JP Nagar','Bangalore','2025-01-15'),
('Priya Sharma','Female',26,'O+','9876543211','priya@gmail.com','Vijayanagar','Mysore','2025-02-10'),
('Amit Verma','Male',30,'B+','9876543212','amit@gmail.com','Rajajinagar','Bangalore','2025-02-18'),
('Sneha Reddy','Female',22,'AB+','9876543213','sneha@gmail.com','BTM Layout','Bangalore','2025-03-05'),
('Karthik Rao','Male',28,'A-','9876543214','karthik@gmail.com','Jayanagar','Bangalore','2025-03-15'),
('Anjali N','Female',25,'O-','9876543215','anjali@gmail.com','Hebbal','Bangalore','2025-04-01'),
('Rakesh M','Male',31,'B-','9876543216','rakesh@gmail.com','RR Nagar','Mysore','2025-04-12'),
('Pooja S','Female',23,'AB-','9876543217','pooja@gmail.com','Banashankari','Bangalore','2025-05-02'),
('Arun K','Male',29,'O+','9876543218','arun@gmail.com','Indiranagar','Bangalore','2025-05-15'),
('Deepa H','Female',27,'A+','9876543219','deepa@gmail.com','Whitefield','Bangalore','2025-06-01');

----------------------------------------------------------
-- Insert Patients
----------------------------------------------------------

INSERT INTO Patient
(PatientName, Gender, Age, BloodGroup, Phone, Address, City)
VALUES
('Suresh P','Male',45,'O+','9988001101','Apollo Hospital','Bangalore'),
('Lakshmi R','Female',36,'A+','9988001102','Manipal Hospital','Bangalore'),
('Vinod K','Male',40,'B+','9988001103','Fortis Hospital','Mysore'),
('Meena S','Female',32,'AB+','9988001104','Victoria Hospital','Bangalore'),
('Naveen C','Male',27,'A-','9988001105','BGS Hospital','Bangalore'),
('Kavya T','Female',30,'O-','9988001106','Columbia Asia','Bangalore'),
('Harish M','Male',34,'B-','9988001107','ESI Hospital','Mysore'),
('Asha P','Female',29,'AB-','9988001108','Narayana Hospital','Bangalore'),
('Rohit G','Male',38,'A+','9988001109','Rainbow Hospital','Bangalore'),
('Divya L','Female',25,'O+','9988001110','Aster Hospital','Bangalore');

----------------------------------------------------------
-- Insert Donations
----------------------------------------------------------

INSERT INTO Donation
(DonorID, BloodGroup, UnitsDonated, DonationDate)
VALUES
(1,'A+',1,'2025-01-15'),
(2,'O+',2,'2025-02-10'),
(3,'B+',1,'2025-02-18'),
(4,'AB+',1,'2025-03-05'),
(5,'A-',2,'2025-03-15'),
(6,'O-',1,'2025-04-01'),
(7,'B-',1,'2025-04-12'),
(8,'AB-',1,'2025-05-02'),
(9,'O+',2,'2025-05-15'),
(10,'A+',1,'2025-06-01');

----------------------------------------------------------
-- Insert Blood Requests
----------------------------------------------------------

INSERT INTO BloodRequest
(PatientID, BloodGroup, UnitsRequested, RequestDate, Status)
VALUES
(1,'O+',2,'2025-06-10','Approved'),
(2,'A+',1,'2025-06-11','Pending'),
(3,'B+',2,'2025-06-12','Approved'),
(4,'AB+',1,'2025-06-13','Rejected'),
(5,'A-',1,'2025-06-14','Approved'),
(6,'O-',2,'2025-06-15','Pending'),
(7,'B-',1,'2025-06-16','Approved'),
(8,'AB-',1,'2025-06-17','Rejected'),
(9,'A+',2,'2025-06-18','Pending'),
(10,'O+',1,'2025-06-19','Approved');

----------------------------------------------------------
-- Verify Data
----------------------------------------------------------

SELECT * FROM Donor;
SELECT * FROM Patient;
SELECT * FROM BloodStock;
SELECT * FROM Donation;
SELECT * FROM BloodRequest;

----------------------------------------------------------
-- End of insert_data.sql
----------------------------------------------------------
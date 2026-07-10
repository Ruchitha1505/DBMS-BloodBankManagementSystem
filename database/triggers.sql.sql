/*=========================================================
   Blood Bank Management System
   triggers.sql
=========================================================*/

USE BloodBankManagementSystem;

----------------------------------------------------------
-- Trigger 1
-- Increase blood stock after a donation
----------------------------------------------------------

DELIMITER $$

CREATE TRIGGER trg_after_donation
AFTER INSERT ON Donation
FOR EACH ROW
BEGIN
    UPDATE BloodStock
    SET Quantity = Quantity + NEW.UnitsDonated
    WHERE BloodGroup = NEW.BloodGroup;
END$$

DELIMITER ;

----------------------------------------------------------
-- Trigger 2
-- Reduce blood stock after an approved request
----------------------------------------------------------

DELIMITER $$

CREATE TRIGGER trg_after_request
AFTER INSERT ON BloodRequest
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Approved' THEN
        UPDATE BloodStock
        SET Quantity = Quantity - NEW.UnitsRequested
        WHERE BloodGroup = NEW.BloodGroup;
    END IF;
END$$

DELIMITER ;

----------------------------------------------------------
-- Trigger 3
-- Prevent blood stock from becoming negative
----------------------------------------------------------

DELIMITER $$

CREATE TRIGGER trg_prevent_negative_stock
BEFORE UPDATE ON BloodStock
FOR EACH ROW
BEGIN
    IF NEW.Quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Blood stock cannot be negative.';
    END IF;
END$$

DELIMITER ;

----------------------------------------------------------
-- Trigger 4
-- Validate donor age before inserting
----------------------------------------------------------

DELIMITER $$

CREATE TRIGGER trg_validate_donor_age
BEFORE INSERT ON Donor
FOR EACH ROW
BEGIN
    IF NEW.Age < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Donor must be at least 18 years old.';
    END IF;
END$$

DELIMITER ;

----------------------------------------------------------
-- Trigger 5
-- Validate requested units
----------------------------------------------------------

DELIMITER $$

CREATE TRIGGER trg_validate_request_units
BEFORE INSERT ON BloodRequest
FOR EACH ROW
BEGIN
    IF NEW.UnitsRequested <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Requested units must be greater than zero.';
    END IF;
END$$

DELIMITER ;

----------------------------------------------------------
-- End of triggers.sql
----------------------------------------------------------
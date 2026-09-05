------------------------------------
-- 1. CREATING THE TABLES
------------------------------------
-- Table: Barber
CREATE TABLE Barber (
    BarberID NUMERIC NOT NULL,
    FirstName CHAR(50) NOT NULL,
    LastName CHAR(50) NOT NULL,
    Phone NUMERIC NOT NULL,
    Address CHAR(100) NOT NULL,
    HireDate CHAR(20) NOT NULL,
    PRIMARY KEY (BarberID)
);

-- Table: Equipment
CREATE TABLE Equipment (
    EquipmentID NUMERIC NOT NULL,
    equipment_price NUMERIC NOT NULL,
    equipment_name CHAR(50) NOT NULL,
    PRIMARY KEY (EquipmentID)
);

-- Table: Trainer
CREATE TABLE Trainer (
    TrainerID NUMERIC NOT NULL,
    TrainerFirstName CHAR(50) NOT NULL,
    TrainerLastName CHAR(50) NOT NULL,
    PRIMARY KEY (TrainerID)
);

-- Table: Training
CREATE TABLE Training (
    TrainingID NUMERIC NOT NULL,
    TrainerID NUMERIC NOT NULL,
    Training CHAR(100) NOT NULL,
    PRIMARY KEY (TrainingID, TrainerID),
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);

-- Table: Sales
CREATE TABLE Sales (
    SaleID NUMERIC NOT NULL,
    BarberID NUMERIC NOT NULL,
    sale_type CHAR(50) NOT NULL,
    sale_price NUMERIC NOT NULL,
    PRIMARY KEY (SaleID),
    FOREIGN KEY (BarberID) REFERENCES Barber(BarberID)
);

-- Table: BarberEquipment (Bridge Table)
CREATE TABLE BarberEquipment (
    BarberID NUMERIC NOT NULL,
    EquipmentID NUMERIC NOT NULL,
    PRIMARY KEY (BarberID, EquipmentID),
    FOREIGN KEY (BarberID) REFERENCES Barber(BarberID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

-- Table: BarberTraining (Bridge Table)
CREATE TABLE BarberTraining (
    BarberID NUMERIC NOT NULL,
    TrainingID NUMERIC NOT NULL,
    PRIMARY KEY (BarberID, TrainingID),
    FOREIGN KEY (BarberID) REFERENCES Barber(BarberID),
    FOREIGN KEY (TrainingID) REFERENCES Training(TrainingID)
);

-- ==========================================
-- 2. INSERTING THE DATA
-- ==========================================

-- Populate Barbers
INSERT INTO Barber (BarberID, FirstName, LastName, Phone, Address, HireDate)
VALUES (1, 'Siera', 'Andrews', 2109990899, '800 West Street', 'January 15, 2001'),
       (2, 'Philip', 'Martin', 2109081243, '809 Oak Haven', 'March 18, 2017'),
       (3, 'Daniel', 'Niles', 2109879008, '8908 Main St', 'November 14, 2003'),
       (4, 'Miles', 'Garrett', 2100088979, '15 Wilderness Drive', 'November 15, 2005'),
       (5, 'Jerod', 'Brown', 2100983012, '29 Short Ave', 'March 23, 2016');

-- Populate Equipment
INSERT INTO Equipment (EquipmentID, equipment_name, equipment_price)
VALUES (1, 'Chairs', 500),
       (2, 'Clippers', 200),
       (3, 'Computers', 300),
       (4, 'Internet Router', 600),
       (5, 'Shampoo Products', 80),
       (6, 'Barber Capes', 25);

-- Populate Trainers
INSERT INTO Trainer (TrainerID, TrainerFirstName, TrainerLastName) VALUES 
(1, 'Amy', 'Sullivan'), 
(2, 'Jonathan', 'Alonzo'), 
(3, 'Alfred', 'Potts'), 
(4, 'Derek', 'Williams'), 
(5, 'Wesley', 'Matthews'), 
(6, 'Sarah', 'Burnes'),
(7, 'Cade', 'Johnson'),
(8, 'Candra', 'Lopez');

-- Populate Sales
INSERT INTO Sales (SaleID, BarberID, sale_type, sale_price)
VALUES (1, 1, 'Regular Haircut', 45),
       (2, 2, 'Shave', 15),
       (3, 3, 'Low Fade', 40),
       (4, 4, 'Mid Fade', 45),
       (5, 5, 'High Fade', 45),
       (6, 1, 'Trim', 25),
       (7, 2, 'Scissor Cut', 15),
       (8, 3, 'Buzz Cut', 20);

-- Populate Training
INSERT INTO Training (TrainingID, TrainerID, Training)
VALUES (1, 1, 'Welcome Training'),
       (2, 2, 'Ethics'),
       (3, 3, 'Conflict Management'),
       (3, 7, 'Conflict Management'),
       (4, 4, 'How to Fade Hair'),
       (5, 5, 'Customer Care'),
       (6, 6, 'Practicum'),
       (6, 8, 'Practicum');

-- Populate Barber-Equipment
INSERT INTO BarberEquipment (BarberID, EquipmentID)
VALUES (1, 1), (1, 2), (1, 5), (1, 6),
       (4, 1), (4, 2), (4, 5), (4, 6),
       (2, 1), (2, 2), (2, 5), (2, 6),
       (5, 1), (5, 2), (5, 5), (5, 6);

-- Populate Barber-Training
INSERT INTO BarberTraining (BarberID, TrainingID)
VALUES (1, 1), (1, 3),
       (4, 1), (4, 5), (4, 6),
       (2, 4), (2, 2),
       (5, 1), (5, 2), (5, 4);

-- ==========================================
-- 3. DATA RETRIEVAL
-- ==========================================

-- Barber Table
SELECT *
FROM barbershop.Barber
ORDER BY BarberID;

-- Equipment Table
SELECT *
FROM barbershop.Equipment
ORDER BY EquipmentID;

-- Trainer Table
SELECT *
FROM barbershop.Trainer
ORDER BY TrainerID;

-- Training Table
SELECT *
FROM barbershop.Training
ORDER BY TrainingID, TrainerID;

-- Sales Table
SELECT *
FROM barbershop.Sales
ORDER BY SaleID;

-- BarberEquipment Table
SELECT *
FROM barbershop.BarberEquipment
ORDER BY BarberID, EquipmentID;

-- BarberTrainng Table
SELECT *
FROM barbershop.BarberTraining
ORDER BY BarberID, TrainingID;

-- ==========================================
-- 4. USING THE JUNCTION TABLE (INNER JOIN)
-- ==========================================
SELECT 
	b.BarberID,
    b.FirstName,
    b.LastName,
    be.EquipmentID,
    e.equipment_name
FROM barbershop.barber b
INNER JOIN barbershop.barberequipment be
	ON b.BarberID = be.BarberID
INNER JOIN barbershop.equipment e 
	ON be.EquipmentID = e.EquipmentID
ORDER BY b.barberID;

-- ===============================================
-- 5. USING THE JUNCTION TABLE (LEFT OUTTER JOIN)
-- ===============================================
SELECT 
	b.BarberID,
    b.FirstName,
    b.LastName,
    be.EquipmentID,
    e.equipment_name
FROM barbershop.barber b
LEFT OUTER JOIN barbershop.barberequipment be
	ON b.BarberID = be.BarberID
LEFT OUTER JOIN barbershop.equipment e 
	ON be.EquipmentID = e.EquipmentID
ORDER BY b.barberID;


-- ===============================================
-- 6. SINGLE-LINE SUB QUERY 
-- ===============================================

SELECT BarberID
FROM barbershop.barberequipment
WHERE EquipmentID IN (SELECT EquipmentID FROM barbershop.equipment WHERE equipment_price >= 250)
ORDER BY BarberID;

-- ===============================================
-- 6. MULTI-LINE SUB QUERY 
-- ===============================================
SELECT *    
FROM barbershop.Trainer 
WHERE TrainerID IN (SELECT TrainingID 
					FROM barbershop.Training 
                    WHERE Training = ('Welcome Training') 
					   OR (Training LIKE '%How%') 
                    GROUP BY trainingID HAVING count(TrainingID) <=1)
ORDER BY TrainerID ;

-- ===============================================
-- 7. A aggregated SQL query w/ multiple columns
-- ===============================================
SELECT 
    b.FirstName,
    b.LastName,
	t.training,
    count(b.barberID) as Trainings_attended
FROM barbershop.barber b
LEFT OUTER JOIN barbershop.barbertraining bt 
	ON b.BarberID = bt.BarberID
LEFT OUTER JOIN barbershop.training t
	ON bt.TrainingID = t.TrainingID
WHERE t.training IS NOT NULL
GROUP BY b.firstname, b.lastname, t.training
ORDER BY count(b.barberID);

-- ===============================================
-- 8. SUB QUERY WITH NOT IN
-- ===============================================
SELECT BarberID
FROM barbershop.barberequipment
WHERE EquipmentID NOT IN (SELECT EquipmentID 
					  FROM barbershop.equipment 
                      WHERE equipment_price >= 250)
ORDER BY BarberID;


    
SELECT 
	t.training,
    b.barberID,
    concat(b.FirstName," ", b.LastName)
FROM barbershop.barber b
LEFT OUTER JOIN barbershop.barbertraining bt 
	ON b.BarberID = bt.BarberID
LEFT OUTER JOIN barbershop.training t
	ON bt.TrainingID = t.TrainingID;

-- ===============================================
-- 9. USE A CASE STATEMENT
-- ===============================================
SELECT 
	equipment_name,
    equipment_price,
    CASE WHEN equipment_price < 100 THEN "Low Cost Equipment" 
		WHEN equipment_price >= 100 AND equipment_price <= 300 THEN "Medium Cost Equipment" 
        WHEN equipment_price > 300 THEN "High Cost Equipment" END AS Cost_Buckets
FROM barbershop.equipment
order by equipment_price;

-- ===============================================
-- 10. USE NOT EXISTS
-- ===============================================
SELECT *
FROM barbershop.barber
WHERE NOT EXISTS (SELECT 1 
					  FROM barbershop.barbertraining 
                      WHERE barbertraining.BarberID = barber.BarberID)
ORDER BY BarberID;


-- ===============================================
-- 11. USE NOT NULL INSIDE THE SUB QUERY
-- ===============================================
SELECT *
FROM barbershop.barber
WHERE barberID IN (SELECT barberID
					  FROM barbershop.barberequipment 
                      WHERE barber.BarberID IS NOT NULL)
ORDER BY BarberID;

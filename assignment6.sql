
CREATE TABLE Department (
	DepartmentID TinyINT NOT NULL,
    Department CHAR(30) NOT NULL,
    Primary Key(DepartmentID)
    );
    
INSERT INTO Department (DepartmentID, Department)
VALUES (1, 'Production'),
	   (2, 'IT Support'),
       (3, 'Human Resource Management'),
       (4, 'Research & Development'),
       (5, 'Sales & Marketing'),
       (6, 'Accounting and Finance'),
       (7, 'Legal Department'),
       (8, 'Operations'),
       (9, 'Customer Service'),
       (10, 'Purchasing');


SELECT *
FROM worker.department
ORDER BY DepartmentID;



CREATE TABLE Employee (
	EmployeeID INT NOT NULL,
    DepartmentID TINYINT NULL,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    HireDate Date NOT NULL,
    Primary Key(EmployeeID)
    );
    
INSERT INTO employee 
(EmployeeID, DepartmentID, FirstName, LastName, Address, PhoneNumber, HireDate)  
VALUES 
(1, 1, 'Andy', 'Wong', '(603) 555-6880', '345 South Street', '2001-01-15'),
(2, 2, 'Vivek', 'Pandey', '(603) 555-4420', '15 Mineral Drive', '2003-11-15'),
(3, 3, 'Kathy', 'Cooper', '(212) 555-9630', '15 Hatter Drive', '2011-11-18'),
(4, 4, 'John', 'Wilson', '(518) 555-6690', '560 Broadway', '2017-03-19'),
(5, 5, 'Nolan', 'Davis', '(478) 555-8822', '15 Long Ave', '2016-03-23'),
(6, 6, 'Tom', 'Harper', '(212) 555-7755', '64 Highland Street', '2010-04-11'),
(7, NULL, 'Mike', 'Taylor', '(480) 532-6567', '5212 Saint Croix Ct', '2003-11-14');


SELECT *
FROM worker.employee
ORDER BY EmployeeID;


CREATE TABLE Equipment (
	EquipmentID Integer NOT NULL,
    EquipmentName Varchar(30) NOT NULL,
    EquipmentCostAmount INT NOT NULL,
    Primary Key(EquipmentID)
    );
    
INSERT INTO Equipment 
(EquipmentID, EquipmentName, EquipmentCostAmount)  
VALUES 
(1, 'Notebook Computers', 150),
(2, 'Computer Monitors', 150),
(3, 'Headsets', 50);

SELECT *
FROM worker.equipment
ORDER BY EquipmentID;



CREATE TABLE EmployeeEquipment (
	EmployeeID INT NOT NULL,
	EquipmentID float NOT NULL,
    Primary Key(EmployeeID, EquipmentID)
    );
    
INSERT INTO EmployeeEquipment (EmployeeID, EquipmentID)
VALUES
(1, 1),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 3),
(5, 1),
(5, 3),
(6, 1),
(6, 2);


SELECT *
FROM worker.EmployeeEquipment
ORDER BY EmployeeID, EquipmentID;




CREATE TABLE Training (
	TrainingID Integer NOT NULL,
    TrainingName Varchar(50) NOT NULL,
    Primary Key(TrainingID)
    );
    
INSERT INTO Training(TrainingID, TrainingName)
VALUES (1, 'Safety Training'),
	   (2, 'Code of Conduct Training'),
       (3, 'Security and Privacy'),
       (4, 'Microsoft Certifications'),
       (5, 'Employee Relations'),
       (6, 'Intro to Python'),
       (7, 'Machine Learning'),
       (8, 'Product Knowledge'),
       (9, 'Sales Skills'),
       (10, 'Travel and Expense Management'),
       (11, 'COVID-19 Awareness and Protection Training');


SELECT *
FROM worker.Training
ORDER BY TrainingID;




CREATE TABLE EmployeeTraining (
	EmployeeID Integer NOT NULL,
    TrainingID Integer NOT NULL,
    Primary Key(EmployeeID, TrainingID)
    );
    
INSERT INTO EmployeeTraining (EmployeeID, TrainingID)
VALUES 
		(1, 1),
		(1, 2),
		(2, 2),
		(2, 3),
		(2, 4),
		(3, 2),
		(3, 5),
		(4, 2),
		(4, 6),
		(4, 7),
		(5, 2),
		(5, 8),
		(5, 9),
		(6, 2),
		(6, 10);


SELECT *
FROM worker.EmployeeTraining
ORDER BY EmployeeID, TrainingID;



CREATE TABLE Trainer (
	TrainerID Integer NOT NULL,
	TrainingID Integer NOT NULL,
    TrainerFirstName Varchar(20) NOT NULL,
	TrainerLastName Varchar(20) NULL,
    Primary Key(TrainerID)
    );
    
INSERT INTO Trainer (TrainerID, TrainingID, TrainerFirstName, TrainerLastName)
VALUES (1, 11, 'James', 'Smith'),
	   (2, 2, 'Michael', 'Smith'),
       (3, 1, 'Maria', 'Garcia'),
       (4, 6, 'John', null),
       (5, 7, 'Mike', 'Taylor'),
       (6, 4, 'Robert', 'Smith'),
       (7, 3, 'Maria', 'Rodriguez'),
       (8, 8, 'Mike', 'Donlon'),
       (9, 9, 'Kathy', 'Corby'),
       (10, 5, 'Mary', 'Garcia'),
       (11, 10, 'Jordan', null),
       (12, 11, 'Johnny', 'Khor'),
       (13, 5, 'Vanessa', null),
       (14, 10, 'Maria', 'Hernandez'),
       (15, 6, 'Paul', 'Deitel'),
       (16, 7, 'Avinash', 'Navlani');


SELECT *
FROM worker.Trainer
ORDER BY TrainerID;



Select *
FROM worker.Trainer
Where TrainerLastName IS NULL
Order by TrainerID;




SELECT *
FROM Worker.Employee
WHERE HireDate IN (SELECT MAX(HireDate)
FROM Worker.Employee
GROUP BY YEAR(HireDate), MONTH(HireDate))
ORDER BY EmployeeID;



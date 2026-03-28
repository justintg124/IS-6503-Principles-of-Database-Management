-- Question 1: Sort the results by EmployeeID, EquipmentID; 
SELECT 
	e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    eq.EquipmentID, 
    eq.EquipmentName
FROM worker.employee e
INNER JOIN worker.employeeequipment eeq 
	ON e.EmployeeID = eeq.EmployeeID
INNER JOIN worker.equipment eq
	ON eeq.EquipmentID = eq.EquipmentID
ORDER BY EmployeeID, EquipmentID;

-- Question 2: Sort the results by EmployeeID, TrainingID; 
SELECT
	e.EmployeeID,
	e.FirstName,
	e.LastName,
	t.TrainingID,
	t.TrainingName
FROM worker.employee e
INNER JOIN worker.employeetraining et 
	ON e.EmployeeID = et.EmployeeID
INNER JOIN worker.training t
	ON et.TrainingID = t.TrainingID
ORDER BY EmployeeID, TrainingID;

-- Question 3: single-row subquery
SELECT
	EmployeeID, 
    FirstName,
    LastName,
    HireDate
FROM worker.employee
WHERE Hiredate IN (SELECT HireDate FROM worker.employee WHERE HireDate > '2003-11-15')
ORDER BY EmployeeID;

-- Question 4: 
SELECT 
	e.FirstName,
    e.LastName,
    t.TrainingName
FROM worker.employee e
INNER JOIN worker.employeetraining et 
	ON e.EmployeeID = et.EmployeeID
INNER JOIN worker.training t
	ON et.TrainingID = t.TrainingID
WHERE e.FirstName = 'Tom'
AND e.LastName = 'Harper'
ORDER BY TrainingName;

-- Question 5:
SELECT 
	t.TrainingName,
    t1.TrainerFirstName,
    t1.TrainerLastName
FROM worker.training t
INNER JOIN worker.trainer t1 
	ON t.TrainingID = t1.TrainingID
ORDER BY TrainingName, TrainerFirstName, TrainerLastName;

-- Question 6:
SELECT
	e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.HireDate
FROM worker.employee e
INNER JOIN worker.department d
ON d.DepartmentID = e.DepartmentID
WHERE e.DepartmentID IN (SELECT DepartmentID
					FROM worker.department
					WHERE Department IN ('Accounting and Finance', 'IT Support', 'Production'))
ORDER BY EmployeeID;

-- Question 7:
SELECT
	e.EmployeeID,
    e.FirstName,
    e.LastName,
	eq.EquipmentName,
    eq.EquipmentCostAmount
FROM worker.employee e
INNER JOIN worker.employeeequipment eeq 
ON e.EmployeeID = eeq.EmployeeID
INNER JOIN worker.equipment eq 
ON eeq.EquipmentID = eq.EquipmentID
ORDER BY EmployeeID
LIMIT 2; 

-- Question 8:
SELECT
	t.TrainingID,
    t1.TrainingName,
    t.TrainerID,
    t.TrainerFirstName,
    t.TrainerLastName
FROM worker.trainer t
INNER JOIN worker.training t1
ON t.TrainingID = t1.TrainingID
WHERE TrainerLastName IS NULL
ORDER BY t.TrainingID, t.TrainerID;

-- Question 9: Distinct equipment
SELECT DISTINCT
	eq.EquipmentName
FROM worker.employee e
INNER JOIN worker.employeeequipment eeq 
ON e.EmployeeID = eeq.EmployeeID
INNER JOIN worker.equipment eq 
ON eeq.EquipmentID = eq.EquipmentID
WHERE e.EmployeeID IN (select EmployeeID from employeeequipment where EmployeeID IS NOT NULL)
ORDER BY EquipmentName;

-- Question 10:
SELECT 
	e.FirstName,
    e.LastName,
    t.TrainingName,
    t1.TrainerFirstName,
    t1.TrainerLastName
FROM worker.employee e
INNER JOIN worker.employeetraining et 
	ON e.EmployeeID = et.EmployeeID
INNER JOIN worker.training t
	ON et.TrainingID = t.TrainingID
INNER JOIN worker.trainer t1
	ON t1.TrainingID = t.TrainingID
WHERE e.FirstName IN ('Andy', 'John')
ORDER BY e.LastName, t.TrainingName;

-- Question 11:
SELECT
	e.EmployeeID,
    e.FirstName,
    e.LastName,
    d.DepartmentID,
    d.Department,
    eq.EquipmentID,
    eq.EquipmentName
FROM worker.employee e
INNER JOIN Department d
ON e.DepartmentID = d.DepartmentID
INNER JOIN worker.employeeequipment eeq 
ON e.EmployeeID = eeq.EmployeeID
INNER JOIN worker.equipment eq 
ON eeq.EquipmentID = eq.EquipmentID
ORDER BY e.EmployeeID, e.DepartmentID, eq.EquipmentID;


-- Question 12:
SELECT
	e.EmployeeID,
    e.FirstName,
    e.LastName,
    d.DepartmentID,
    d.Department,
    t.TrainingID,
    t.TrainingName
FROM worker.employee e
INNER JOIN worker.Department d
ON e.DepartmentID = d.DepartmentID
INNER JOIN worker.employeetraining et
ON et.EmployeeID = e.EmployeeID
INNER JOIN worker.training t
ON et.TrainingID = t.TrainingID
ORDER BY e.EmployeeID, e.DepartmentID, t.TrainingID
-- Query 1
SELECT distinct 
	TrainerFirstName
FROM worker.Trainer
Order by TrainerFirstname asc;

-- Question 2: employees with HireDate greater than January 11, 2011
SELECT 
	Firstname,
    LastName,
    HireDate
FROM worker.employee
WHERE HireDate > '2011-01-11'
ORDER BY HireDate;

-- Question 3: employees hired between January 11, 2005, and January 11, 2011
SELECT 
	Firstname,
    LastName,
    HireDate
FROM worker.employee
WHERE HireDate between '2005-01-11' and '2011-01-11'
ORDER BY HireDate ASC;

-- Question 4:
SELECT 
	FirstName,
    LastName,
    DepartmentId
FROM worker.employee
ORDER BY DepartmentId, LastName;

-- Question 5:
SELECT 
	EquipmentID,
    EquipmentName,
    round(EquipmentCostAmount * 1.15) as NewEquipmentCost
FROM worker.equipment
ORDER BY EquipmentID;

-- Question 6:
SELECT 
	FirstName,
    LastName,
    HireDate,
    year(HireDate) as Year
FROM worker.employee
ORDER BY Year, LastName;


-- Question 7:
SELECT 
	FirstName,
    LastName,
    HireDate
FROM worker.employee
ORDER BY HireDate DESC;

-- Question 8:
SELECT *
FROM worker.employee
WHERE HireDate = (SELECT min(HireDate) FROM worker.employee);


-- Question 9
select
	sum(DepartmentID) as DepartmentID,
	min(HireDate) as 'MinHireDate',
    max(Hiredate) as 'MaxHireDate'
from worker.employee
group by DepartmentID;


-- Question 10
select 
	count(*) as 'NumberOfTrainers',
    max(t1.TrainingName) as 'TrainingName'
from trainer t
left join training t1 on t.TrainingID = t1.TrainingID
group by t1.trainingname
order by t1.TrainingName;
-JOINS


--SELECT EVERYTHING FROM BOTH TABLES

SELECT * FROM
`niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performance` table2
ON table1.EmpID = table2.EmpID;

SELECT * FROM
`niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performanceshort` table2
ON table1.EmpID = table2.EmpID;


--SELECT EMP_ID, EMP_NAME, PERFORMANCESCORE

--tablename.columnname

SELECT table1.EmpID, table1.Employee_name, table2.PerformanceScore
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performance` table2
ON table1.EmpID = table2.EmpID;


--SELECT EMP_ID, employee_name, dayslatelast30days, absences-using full Performance table

SELECT table1.EmpID, table1.Employee_name, table2.DaysLateLast30, table2.absences
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performance` table2
ON table1.EmpID = table2.EmpID;


--LEFT JOIN hr_performanceshort

SELECT * FROM
`niyo-bootcamp-394518.NIYO.HR_DATASET` table1
LEFT JOIN `niyo-bootcamp-394518.NIYO.hr_performanceshort` table2
ON table1.EmpID = table2.EmpID;



--RIGHT JOIN hr_performanceshort

SELECT * FROM
`niyo-bootcamp-394518.NIYO.HR_DATASET` table1
RIGHT JOIN `niyo-bootcamp-394518.NIYO.hr_performanceshort` table2
ON table1.EmpID = table2.EmpID;

--Return employee name, id department and manager name- performance short

SELECT table1.EmpID, table1.Employee_name, table1.Department, table2.managername
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
LEFT JOIN `niyo-bootcamp-394518.NIYO.hr_performanceshort` table2
ON table1.EmpID = table2.EmpID;

--Find the employees who have had more than 10 absences - use full hr_performance

SELECT table1.EmpID, table1.Employee_name, table2.absences
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performance` table2
ON table1.EmpID = table2.EmpID
WHERE table2.Absences >= 10;


--CHECK EmpID 10238- Use left join -hr_performanceshort

SELECT table1.EmpID, table1.Employee_name, ManagerName
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
LEFT JOIN `niyo-bootcamp-394518.NIYO.hr_performanceshort` table2
ON table1.EmpID = table2.EmpID
WHERE table1.EmpID = 10238;

--Find the Avg Salary per recruitment source platform

SELECT table2.RecruitmentSource, AVG(table1.salary) AS AvgSalary
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performance` table2
ON table1.EmpID = table2.EmpID
GROUP BY table2.RecruitmentSource 
ORDER BY 1 DESC;


-- find the employees that have satisifaction less than 3

SELECT table1.EmpID, table1.Employee_Name, EmpSatisfaction
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performance` table2
ON table1.EmpID = table2.EmpID
WHERE EmpSatisfaction < 3;


-- find the employees that have satisifaction less than 3 and absences greater than 10

SELECT table1.EmpID, table1.Employee_Name, table2.EmpSatisfaction, table2.Absences
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performance` table2
ON table1.EmpID = table2.EmpID
WHERE EmpSatisfaction < 3 AND Absences > 10;


-- find the total number of days late per sex and race

SELECT table1.Sex, table1.RaceDesc, COUNT(table2.DaysLateLast30) AS TotalNumberofDaysLate
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performance` table2
ON table1.EmpID = table2.EmpID
GROUP BY table1.Sex, table1.RaceDesc;


--Find employees where performance fully meets or exceed an engagement greater than 4.5

SELECT table1.EmpID, table1.Employee_Name, table2.PerformanceScore,table2.EngagementSurvey
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performance` table2
ON table1.EmpID = table2.EmpID
WHERE PerformanceScore IN ('Fully Meets', 'Exceeds') AND EngagementSurvey > 4.5
ORDER BY 4 DESC;


-- Find the average satisfaction based on department and position 

SELECT table1.Department,table1.Position,AVG(table2.EmpSatisfaction) AS AvgEmpSatisfaction
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` table1
INNER JOIN `niyo-bootcamp-394518.NIYO.hr_performance` table2
ON table1.EmpID = table2.EmpID
GROUP BY table1.Department, table1.Position;



-- Find the total number of days late per department where gender = f


--DATES

SELECT CURRENT_DATE() AS TodaysDate


--Dateadd which adds a particular interval to our date

SELECT DATE_ADD(DATE '2023-08-23', INTERVAL 5 DAY);


SELECT DATE_DIFF(DATE '2023-08-25', DATE '2023-08-07', DAY) AS days_diff;


--Extract part from date

SELECT EXTRACT(YEAR FROM DATE '2013-12-25') AS the_day;

--Find the age of each employee

SELECT Employee_Name, DOB, DATE_DIFF(CURRENT_DATE(), DOB, YEAR) AS AGE
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET`
ORDER BY 3 DESC;

SELECT 2023-1993;

SELECT EXTRACT(YEAR FROM DOB), EXTRACT(YEAR FROM CURRENT_DATE()),
EXTRACT(YEAR FROM CURRENT_DATE()) - EXTRACT(YEAR FROM DOB)
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET`;

--Find the difference between DateofHire and Daye of Termination

SELECT Employee_Name, DateofHire, DateofTermination, 
DATE_DIFF(DateofTermination, DateofHire, Year) AS NoofYearsAtCompany,
DATE_DIFF(DateofTermination, DateofHire, Month) AS NoofMonthsAtCompany,
DATE_DIFF(DateofTermination, DateofHire, Day) AS NoofDaysAtCompany,
FROM `niyo-bootcamp-394518.NIYO.HR_DATASET` 
WHERE EmploymentStatus != 'Active'



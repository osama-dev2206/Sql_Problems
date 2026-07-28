use HR_DB ;

Select * From Countries ;
Select * From Employees ;
Select * From Departments ; 

-- Inner Join 
Select Employees.FirstName + ' ' + Employees.LastName as FullName ,
Departments.Name 
From Employees 
INNER JOIN Departments 
On Departments.ID = Employees.DepartmentID 
order By Employees.ID asc ;

-- Get All Data From Table Employees and thier departments even they don't have
Select DepartmentID ,
Departments.ID,
Departments.Name 
From Departments 
Left JOIN  Employees
On Departments.ID = Employees.DepartmentID 
order By Employees.ID asc ;

Select * From EmpsPersonalDetails; 

--- View: is a vitual table based on the set of sql statments 

select * From EmpsPersonalDetails ; -- View NOT Real Table 
Select * From EmpsCountries ; 

Select * From EmpsDept ;


--- Exists --> check if the subquery Rerturns 1 record or more

Select * 
From EmpsDept 
Where 
Exists --> T or F 
(
Select * From Sys.Databases where name='HR_DB'
);


Select 'Yes' as X 
where 
Exists(
Select Employees.ID From Employees 
where Employees.ID = 400 
);

Select Departments.ID,
Departments.Name
From Departments 
where 
Exists --> F 
(
select * from Employees
where Employees.DepartmentID Is Null 
);

Select Departments.ID,
Departments.Name
From Departments 
where 
Exists --> T 
(
select * from Employees
where Employees.DepartmentID Is Not Null 
);

-- Optimize the query 
Select Departments.ID,
Departments.Name
From Departments 
where 
Exists --> T 
(
select top 1 R='Y' from Employees
where Employees.DepartmentID Is Not Null 
);



--List all employees who belong to the “IT” department.
--Use EXISTS to check the department.
Select FirstName , LastName , Departments.Name
From Employees 
Inner Join Departments 
On Departments.ID = Employees.DepartmentID 
where Exists 
(
Select R = 'Y' 
From Departments 
where Employees.DepartmentID  = Departments.ID 
And Departments.Name = 'IT' 
); 

--List all employees who have a BonusPerc greater than 20%.
--Use EXISTS to filter employees.

Select * 
from Employees
where 
Exists 
(
 Select E2.BonusPerc 
 From Employees as E2
 where BonusPerc > (0.20) And 
 Employees.Id = E2.ID 
);

--List all employees who work in countries whose name starts with “U”.
--Use EXISTS to check the country.

Select * 
From Employees 
Inner Join Countries 
On Employees.CountryID = Countries.ID
where 
Exists
(
Select R='Y'  
from Countries 
where Countries.ID = Employees.CountryID 
AND 
Countries.Name Like 'U%' 
);


--List all departments that have at least one female employee.
--Use EXISTS to check for employees in each department.
Select  
Employees.Gender, 
Employees.FirstName ,
Departments.Name
From Employees 
Inner Join Departments On
Employees.DepartmentID = Departments.ID 
where Exists 
(
Select Y='T'
From Employees AS E 
where Gender = 'F' 
And E.ID = Employees.ID 
Group By E.DepartmentID 
Having Count(E.ID) >=1 
);

--List all employees who are still employed (ExitDate IS NULL).
--Use EXISTS to filter employees.

Select * 
From Employees 
where
Exists 
(
Select Y='t'
From Employees as E
Where E.ExitDate Is Null And
E.ID = Employees.ID  
);

--Create view ResignedEmployees As 
--Select * From Employees
--where ExitDate Is Not Null ; 

--Create view ActiveEmployees As 
--Select * From Employees
--where ExitDate Is Null ; 

---- Union
-- the same num of columns 
-- the same data type 
-- in the same order 

 -- The Same Num of cols , the same data type , The Same Order 
Select * from ActiveEmployees ;
Select * From ResignedEmployees ;

Select * from ActiveEmployees 
Union -- Combine Result  set without duplication 
Select * From ResignedEmployees ;

Select * From Departments 
Union -- Combine Result  set without duplication 
Select * From Departments ;


Select * From Departments 
Union All -- Combine Result set with duplication 
Select * From Departments ;


-- Create a view for Departments with more than 120 employees.
-- Create a view for Departments that have at least one female employee.
-- Combine the results into a single list of DepartmentIDs 
--using UNION ALL (keep duplicates).

create view MoreThan120EmpInDept As 
Select Count(*) As EmpCount,
Employees.DepartmentID
from Employees 
Group By(DepartmentID) 
Having Count(*)>120; 

create view AtLeast1Female As 
Select Count(*) As FemalesCount,
Employees.DepartmentID
from Employees 
where Gender ='F' 
Group By(DepartmentID) 
Having Count(*)>=1; 

Select * From AtLeast1Female 
Union All 
Select * From MoreThan120EmpInDept ;


----  Create a view for employees with BonusPerc > 20%, 
-- including department name.
-- Create a view for employees with MonthlySalary > 2700, 
-- including department name.
-- Combine both views into a distinct list of employees using UNION.

Create View BPMoreThan20Per AS 
Select Departments.Name ,
Employees.FirstName ,
Employees.ID
From Employees 
INNER Join Departments 
On Employees.DepartmentID = Departments.ID
where BonusPerc>(0.20);

Create View MSalaryMoreThan2700 As 
Select Departments.Name ,
Employees.FirstName ,
Employees.ID
From Employees 
INNER Join Departments 
On Employees.DepartmentID = Departments.ID
where MonthlySalary>2700;

Select * from MSalaryMoreThan2700 
Union
Select * From BPMoreThan20Per ; 


-- Create a view for employees working in China, including country name.
--Create a view for employees working in the USA, including country name.
--Combine both views using UNION 
--to get a distinct list of employees from these countries.

Create View ChineeseEmps AS 
Select Countries.Name As Country ,
Employees.FirstName ,
Employees.ID
From Countries 
INNER JOIN Employees 
ON Countries.ID = Employees.CountryID 
where Countries.Name = 'China' ;


Create View AmericanEmps AS 
Select Countries.Name As Country ,
Employees.FirstName ,
Employees.ID
From Countries 
INNER JOIN Employees 
ON Countries.ID = Employees.CountryID 
where Countries.Name = 'Usa' ;

Select * From ChineeseEmps 
UNION
Select * From AmericanEmps ; 



--  Case 
Select FirstName , 
LastName  , 
GenderTitle = 
Case
 When Gender='M' Then 'Male' 
 When Gender='F' Then 'Female'
 ELSE 'IDK' 
END 

From Employees ;


Select FirstName , 
LastName  , 
EmploymentStatus =
Case 
	when Employees.HireDate Is Not Null And Employees.ExitDate Is NUll 
	Then 'Employed'
	
	When Employees.HireDate Is Null  Then 'UNKNOWN'

	When Employees.ExitDate Is NUll Then 'Fired' 
END

From Employees ;


Select FirstName , 
LastName  , 
Salary =
Case 
	when (MonthlySalary between 200 and 1000) And Gender ='F' 
	Then  MonthlySalary * 1.15 
	
	when (MonthlySalary between 200 and 1000) And Gender ='M' 
	Then  MonthlySalary * 1.20

	Else MonthlySalary
END

From Employees ;

--Question 1 – Salary Category
--Classify employees based on their salary.
--Rules:
--< 1000 → Low
--1000-3000 → Medium
--7000 → High
Select FirstName + ' ' + LastName as [Full Name] ,
DateDiff(Year , Employees.DateOfBirth,GETDATE()) as Age  ,
Gender =
Case 
	When Gender='F' Then 'Female'
	When Gender='M' Then 'Male'
	Else 'والله معرفش مله اهلك ايه بقا'
End 
,
ClassificationOfEmp =
Case 
	WHen MonthlySalary<1000 Then 'Low' 
	WHen MonthlySalary between 1000 and 3000 Then 'Meduim'
	WHen MonthlySalary >= 7000 Then 'High' 
	Else 'Unknown' 
End

From Employees 

--Categorize employees based on age (use DateOfBirth).
--Rules:
--< 25 → Young
--25–40 → Adult
--40 → Senior
Create View AgeClass AS 
Select Categorize = 
Case
	When DateDiff(YEAR,DateOfBirth,GetDate()) <25 Then 'Young'
	When DateDiff(YEAR,DateOfBirth,GetDate()) Between 25 and 40 
	Then 'Adult'

	When DateDiff(YEAR,DateOfBirth,GetDate()) >= 40 
	Then 'Senior'

End
From Employees



Select FirstName + ' ' + LastName as [Full Name] ,
DateDiff(Year , Employees.DateOfBirth,GETDATE()) as Age  ,
Gender =
Case 
	When Gender='F' Then 'Female'
	When Gender='M' Then 'Male'
	Else 'والله معرفش مله اهلك ايه بقا'
End 
, Categorize =
Case
	When DateDiff(YEAR,DateOfBirth,GetDate()) <25 Then 'Young'
	When DateDiff(YEAR,DateOfBirth,GetDate()) Between 25 and 40 
	Then 'Adult'

	When DateDiff(YEAR,DateOfBirth,GetDate()) >= 40 
	Then 'Senior'

End


From Employees 

--Categorize employees based on BonusPerc.
--Rules:
--NULL → No Bonus
--< 10 → Low Bonus
--10–20 → Medium Bonus
--20 → High Bonus
Select Employees.ID , 
Employees.FirstName ,
Employees.LastName ,
Bouns =
Case 

 When  Employees.BonusPerc>10 
 Then 'Low Bouns'

 When Employees.BonusPerc Between 10 and 20 
 Then 'Meduim Bouns' 

 When Employees.BonusPerc >=20 
 Then 'High Bouns' 

 Else NUll 
End
From Employees 


--Country + Department Label
--Create a custom label combining logic from Countries and Departments.
--Rules:
--If Country is "USA" → 'Local Employee'
--If Country is not "USA" → 'Foreign Employee'
--If Department name contains "IT" → 'Tech'
--Otherwise → 'Non-Tech'

Select Employees.FirstName +' '+Employees.LastName As 'Full Name',
Employees.ID AS 'Emp ID' ,
Departments.Name As 'Dept Name' ,
Countries.Name As 'Country Name' ,
EmpCountryStatus = 
Case
	When Countries.Name = 'Usa' Then 'Local Employee'
	When Countries.Name <> 'Usa' Then 'Foreign Employee'
End 

, Specialist =
Case
	When Departments.Name='IT' Then 'Tech'
	Else 'Non-Tech' 
End
From Employees 
INNer Join Countries
ON Countries.ID = Employees.CountryID 

Inner Join Departments 
ON Employees.DepartmentID = Departments.ID 




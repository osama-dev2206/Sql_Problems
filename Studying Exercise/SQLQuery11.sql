create view EmpsPersonalDetails as 
Select Employees.FirstName + ' ' + Employees.LastName As 'Full Name' ,
DateDiff(Year , Employees.DateOfBirth , GETDate() ) AS Age , 
Employees.Gender,
Year(Employees.HireDate) As [The Year Of Hiring] 
From Employees 
where Employees.ExitDate Is Null ; 

create View EmpsCountries As 
Select Employees.FirstName + ' ' + Employees.LastName As 'Full Name' ,
Countries.Name 
From Employees 
INNER Join Countries On
Countries.ID = Employees.CountryID ; 

create View EmpsDept AS 
Select
EmpsPersonalDetails.FirstName + ' ' + EmpsPersonalDetails.LastName as 'Full Name' ,
DateDiff(Year , EmpsPersonalDetails.DateOfBirth , GETDate() ) AS Age,
EmpsPersonalDetails.Gender,
Departments.Name as 'Department Name'
From Employees as EmpsPersonalDetails
Inner Join Departments 
ON Departments.ID = EmpsPersonalDetails.DepartmentID; 

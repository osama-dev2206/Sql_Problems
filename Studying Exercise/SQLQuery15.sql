Select * from Employees
order by ID Asc;
-- #1 
-- before using index 
Select FirstName , LastName from Employees  ---  8 ms. 
where FirstName like 'a%';

create index Indx_Name 
On Employees (FirstName,LastName) -- > create non-clustred index for these columns 

-- After using index 
Select FirstName , LastName from Employees  ---  4 ms. 
where FirstName like 'a%';

-- #2 
-- before using index 
Select FirstName + LastName As Full_Name , -- 30 ms. 
Departments.Name
From Employees 
INNER JOIN Departments 
ON Departments.ID = Employees.DepartmentID ; 

create Index Indx_NameOfDept 
ON Departments(Name) ;

-- After using index 
Select FirstName + LastName As Full_Name , -- 24 ms. 
Departments.Name
From Employees 
INNER JOIN Departments 
ON Departments.ID = Employees.DepartmentID ; 
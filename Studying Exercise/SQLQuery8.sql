use HR_DB;


-- DQL 

---------- Select .... as 
Select A=19 , B =20 ;
Select A=18*12 , B = 12/2;
Select A=10 , B=10 from Employees; 

Select Firstname,Lastname ,
MonthlySalary=MonthlySalary/2
from Employees; 

Select Firstname as fname ,
Id from Employees;

Select Id , 
Firstname+' '+Lastname as [Full Name]
from Employees ; 

Select Id ,
[Full Name]=Firstname+' '+Lastname -- expression 
from Employees; 

Select Id ,
Firstname + ' '+Lastname as [Full Name] ,
MonthlySalary*12 as [Yearly Salary] 
from Employees; 


Select Firstname + ' '+Lastname as [Full Name] , 
YearlySalary = MonthlySalary*12 ,
 MonthlySalary * Employees.BonusPerc as BonusAmount 
 from Employees; 

 Select today = getDate();

 Select Firstname + ' ' + Lastname as FullName ,
 Age = DATEDIFF(year,DateOfBirth,GetDate()) 
 from Employees
 order by Age desc ; 

Select Distinct top 5 Age = DateDiff(year,DateOfBirth , GetDate()) 
from Employees 
order by Age desc ; 


Select Firstname + ' ' + Lastname as [Full Name] , 
Age = DateDiff(year,DateOfBirth,GetDate())
from Employees 
where DateDiff(year,DateOfBirth,GetDate()) in
(
Select Distinct top 5 Age = DateDiff(year,DateOfBirth , GetDate()) 
from Employees 
order by Age desc
)
order by Age desc ;
 
-- Challenge : get the names of top 5 emps that take high salray yeraly

Select distinct top 5 YearlySalray = MonthlySalary *12 
From Employees 
order by YearlySalray desc ; 

Select [Full Name]=Firstname +' ' + Lastname ,
YearlySalary=MonthlySalary *12   
from Employees
where MonthlySalary *12 
in
(
Select distinct top 5 YearlySalray = MonthlySalary *12 
From Employees 
order by YearlySalray desc
)
order by YearlySalary  desc;


-- Between 

Select MonthlySalary from Employees 
where (MonthlySalary>=500 and MonthlySalary<=1000); 

Select MonthlySalary from Employees 
where MonthlySalary between 500 and 1000 ; 

-- Hire Date 
-- Start : 2020-01-01 
-- End : 2025-12-31

Select Employees.HireDate from Employees
where HireDate between '2020-01-01' and '2025-12-31'; 

-- Dept 1 ,3 ,5 
Select Employees.FirstName + ' ' + Employees.LastName As 'Full Name', 
Age = DateDiff(year,Employees.DateOfBirth , GetDate() )
From Employees 
Where Employees.DepartmentID in (1,3,5) 
And 
HireDate between '2020-01-01' and '2025-12-31'; 

--  COUNT(), AVG() and SUM()

Select Max(MonthlySalary) As TheLargestSalary ,
Min(MonthlySalary) as TheLeastSalary , 
Count(Employees.ID) as TheNumOfEmps ,
TheAvgSalary = Avg(MonthlySalary) 
from Employees; 

--1 
Select AvgSalary = Avg(MonthlySalary) 
from Employees; 

-- M / D / Y 
Select FullName = Firstname + ' ' + Lastname 
from Employees 
where 
Employees.ExitDate is null and 
(Employees.DateOfBirth between '1-1-1997' and '12-31-1998' ) and
DepartmentID in (1,2) ;

Select * from Employees where
ExitDate is null ;

Select Count(Id) from Employees
where ExitDate is null ; 

-- Group by

Select TotalCount = Count(Id)
from Employees ; 

Select TotalCount = Count(Id)
from Employees 
group by DepartmentID ; 

Select DepartmentID,NumOfEmpsInEachDept = Count(Id)  
from Employees
group by DepartmentID 
order by DepartmentID ; 

Select DepartmentID,Sum(MonthlySalary) as Total 
from Employees
group by DepartmentID 
order by DepartmentID ; 

Select DepartmentID,Min(MonthlySalary) as Min 
from Employees
group by DepartmentID 
order by DepartmentID ; 

Select DepartmentId , Max(MonthlySalary) as Max
from Employees 
group by DepartmentId
order by DepartmentId;

Select DepartmentId,max(Employees.HireDate) as MaxHireDate
from Employees 
group by DepartmentId
order by DepartmentId asc;


Select DepartmentId,min(Employees.HireDate) as MaxHireDate
from Employees 
group by DepartmentId
order by DepartmentId asc; 


Select year(HireDate) as 'Year',
count(Id) as NumOfEmpsEachYear 
from Employees
group by year(HireDate)
order by year(HireDate) asc; 

Select DepartmentID,Count(Id) as NumOfEmps,
avg(MonthlySalary) as AvgSalary
from Employees 
group by DepartmentID 
order by DepartmentID asc ;




Select DepartmentID,Max(MonthlySalary) as MaxSalary,
Min(MonthlySalary) as MinSalary
from Employees 
group by DepartmentID 
order by DepartmentID asc ;

Select Employees.DepartmentID ,
Sum(Employees.BonusPerc) as SumOfBounsPerc
from Employees 
group by DepartmentID
order by DepartmentID; 

Select 
DepartmentID , Count(Id) as CountOfEmps
from Employees 
group by DepartmentID
order by DepartmentID; 






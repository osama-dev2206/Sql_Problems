RESTORE DATABASE HR_Database
from disk ='D:\Self-Study\Db\Database Backup\Full Backup\HR_Database.bak';

use HR_DB;

EXEC sp_changedbowner 'sa';

-- DQL 
Select * From Employees; --> '*' Return All Columns Of This Table

Select FirstName , LastName , CountryId from Employees; 

Select Countries.* From Countries ; -- it is exactly the same as Select * 

Select FirstName , LastName , CountryId 
from Employees; 

Select * From Departments;

Select Departments.Name from Departments; 

--Select Employees.FirstName+' '+Employees.LastName  as 'Full Name' ,
--DateOfBirth into EmpsPersonalDetails 
--from Employees;

Select Employees.FirstName ,Employees.Gender from Employees; 

Select * from EmpsPersonalDetails; 

-- DML
--Rename Column
exec sp_rename 'Employees.Gendor' , 'Gender','COLUMN'   ; 

--- DQL 
Select  FirstName , DepartmentId from Employees; 
Select Distinct FirstName , DepartmentId from Employees; 

Select DepartmentId from Employees; 
Select Distinct  DepartmentId from Employees; 

Select Employees.FirstName from Employees;
Select Distinct Employees.FirstName from Employees; 

Select Distinct Employees.FirstName,Employees.LastName from Employees; 

Select EmpsPersonalDetails.[Full Name] from EmpsPersonalDetails; 
Select Distinct EmpsPersonalDetails.[Full Name] from EmpsPersonalDetails;

-- DQL - Where Statment 

Select * From Employees where FirstName= 'Harper' ; 

Select * From Employees where Gender='f' ;
Select FirstName From Employees where Gender='f' ;

Select FirstName,Gender From Employees where Gender<>'f' 
and MonthlySalary>=2000; 

Select * From Countries where NOT Countries.Name='uk'; 

Select DateOfBirth , FirstName , LastName from Employees
where MonthlySalary>=1000;


Select * From Employees where (Gender = 'f') and 
(MonthlySalary >500 and MonthlySalary <1000 ) ; 


Select Employees.FirstName,Employees.LastName,
Employees.Gender,Employees.BonusPerc
From Employees where (Gender = 'f') and 
(MonthlySalary >500 and MonthlySalary <1000 ) ; 

Select FirstName + ' ' + LastName as Full_Name 
from Employees where CountryID<>1; 

Select FirstName + ' ' + LastName as Full_Name 
from Employees where NOT CountryID=1; 

-- C1 
SELECT Employees.FirstName,
       Employees.LastName,
       Employees.MonthlySalary
FROM   Employees
WHERE  Employees.MonthlySalary >= 1500
       AND Employees.Gender = 'f'; -- C2

SELECT Employees.*
FROM   Employees
WHERE  Employees.BonusPerc > 10
       OR Employees.DepartmentID = 2; -- C3

SELECT Employees.FirstName,
       Employees.CountryID
FROM   Employees
WHERE  NOT Employees.CountryID = 1
       AND Employees.MonthlySalary < 2000; -- C4

SELECT Employees.FirstName,
       Employees.LastName,
       Employees.Gender
FROM   Employees
WHERE  Employees.CountryID <> 1
       AND ((Gender = 'f')
            AND Employees.MonthlySalary < 1000)
       OR ((Gender = 'm')
           AND Employees.MonthlySalary > 2000);

Select Employees.FirstName , Employees.LastName , Employees.Gender
from Employees 
where (Employees.MonthlySalary<=250) or (Employees.MonthlySalary>=400);

 -- In operator 

  --in operator is shorthand of or 
 Select Employees.FirstName , Employees.LastName , Employees.Gender
from Employees 
where (Employees.DepartmentID = 1 or Employees.DepartmentID = 2) or 
( Employees.CountryID = 1  or  Employees.CountryID=2 );

Select Employees.FirstName , Employees.LastName , Employees.Gender
from Employees 
where Employees.DepartmentID in (1 , 2) or 
 Employees.CountryID in (1 , 2) ;


Select Firstname From Employees where FirstName='Harper' or
FirstName='Lucas' or FirstName='Jordan' ;

Select Firstname From Employees where 
FirstName in ('Harper','Lucas','Jordan') ;

Select Departments.Name as [Dept Name] , 
Employees.FirstName + ' ' + Employees.LastName as [Full Name,
Employees.Gender 
as 'Gender' from Departments,Employees
where Employees.DepartmentID 
in(1,2,3,4) ; 

Select Departments.Name as 'Dept Name', 
Employees.FirstName + ' ' + Employees.LastName as [Full Name],
Employees.Gender as 'Gender'
from Departments,Employees
where Employees.DepartmentID 
in
(
Select Employees.DepartmentID from Employees where DepartmentID>=4 
) ; 

Select FirstName , LastName , Gender From Employees 
where MonthlySalary=500 or MonthlySalary=1000 or MonthlySalary>1000 ;

Select FirstName , LastName , Gender From Employees 
where MonthlySalary in (500,1000) or MonthlySalary>1000 ;

-- DMl DC--------------------------
--truncate table EmpsPersonalDetails;
--Select * From TempTable; 
--Select * From EmpsPersonalDetails; 

--insert into EmpsPersonalDetails 



--drop table TempTable;
--select EmpsPersonalDetails.[Full Name] , 
--EmpsPersonalDetails.DateOfBirth 
--into TempTable
--from EmpsPersonalDetails order by [Full Name] asc, DateOfBirth desc ; 
---------------------------------



-- ORDER BY 
select Firstname , MonthlySalary from Employees
order by Firstname , MonthlySalary; -- asceding by default 


select Firstname , MonthlySalary from Employees
order by Firstname asc , MonthlySalary desc; 

-- Full Name Is the main factor to determine what the order should be
-- if there are many records of the same value of Full Name then we
-- will order the records according second column otherwise
-- second column order will be ignored 
select EmpsPersonalDetails.[Full Name] , 
EmpsPersonalDetails.DateOfBirth 
from EmpsPersonalDetails order by [Full Name] asc, DateOfBirth desc ; 

Select * From Employees where MonthlySalary>=500 
order by Employees.MonthlySalary desc ; 

----- TOP statement 

SELECT   DISTINCT TOP 3 PERCENT Employees.MonthlySalary
FROM     Employees
ORDER BY Employees.MonthlySalary DESC;

SELECT   DISTINCT TOP 5 Employees.MonthlySalary
FROM     Employees
ORDER BY MonthlySalary DESC; -- the names of the persons that have the top 5 salray 


SELECT   Employees.FirstName + ' ' + Employees.LastName AS 'Full Name',
         Employees.Gender AS 'Sex',
         Employees.MonthlySalary AS 'Salary'
FROM     Employees
WHERE    Employees.MonthlySalary IN (SELECT   DISTINCT TOP 5 Employees.MonthlySalary
                                     FROM     Employees
                                     ORDER BY MonthlySalary DESC)
ORDER BY Employees.MonthlySalary DESC; -- Get top 3 salaries

SELECT   DISTINCT TOP 3 Employees.MonthlySalary
FROM     Employees
ORDER BY Employees.MonthlySalary DESC;

SELECT   FirstName,
         LastName,
         Gender
FROM     Employees
WHERE    Employees.MonthlySalary IN (SELECT   DISTINCT TOP 3 Employees.MonthlySalary
                                     FROM     Employees
                                     ORDER BY Employees.MonthlySalary DESC)
ORDER BY Employees.MonthlySalary ASC;

SELECT Employees.MonthlySalary
FROM   Employees; 
-- Get The 3 min salaries ------------- ----- 
--هات أسماء الأقسام --اللي فيها موظفين مرتباتهم ضمن اقل 3 مرتبات في الشركة.

SELECT   TOP 3 Employees.MonthlySalary --> اقل 3 مرتبات في الشركه 
FROM     Employees
ORDER BY Employees.MonthlySalary ASC;

SELECT Employees.DepartmentID
FROM   Employees --> their id 
WHERE  Employees.MonthlySalary IN (SELECT   DISTINCT TOP 3 Employees.MonthlySalary
                                   FROM     Employees
                                   ORDER BY Employees.MonthlySalary ASC);

SELECT Departments.Name
FROM   Departments
WHERE  Departments.ID IN (SELECT Employees.DepartmentID
                          FROM   Employees
                          WHERE  Employees.MonthlySalary IN (SELECT   DISTINCT TOP 3 Employees.MonthlySalary
                                                             FROM     Employees
                                                             ORDER BY Employees.MonthlySalary ASC)); -------------------------------------------------------------- -- EX1 --Write a query to select the ID, FirstName, LastName, and BonusPerc --of employees whose bonus percentage is among the top 5 distinct highest values --, ordered ascending by BonusPerc.

SELECT   DISTINCT TOP 5 Employees.BonusPerc --> get top 5 bp 
FROM     Employees
ORDER BY Employees.BonusPerc DESC;

SELECT   Employees.ID,
         Employees.FirstName,
         Employees.LastName,
         Employees.BonusPerc
FROM     Employees
WHERE    Employees.BonusPerc IN (SELECT   DISTINCT TOP 5 Employees.BonusPerc --> get top 5 bp 
                                 FROM     Employees
                                 ORDER BY Employees.BonusPerc DESC)
ORDER BY Employees.BonusPerc ASC; -- Ex2  --Write a query to display the ID, FirstName, LastName, and HireDate of employees  --who have the earliest 3 distinct hire dates, ordered ascending by HireDate.

SELECT   DISTINCT TOP 3 Employees.HireDate
FROM     Employees
ORDER BY Employees.HireDate ASC;


Select Employees.ID , Employees.FirstName , Employees.LastName,Employees.HireDate
from Employees 
where Employees.HireDate in
(
Select Distinct  top 3 Employees.HireDate 
from Employees 
order by Employees.HireDate asc
)
order by  Employees.HireDate asc ;

-- 

-- Write a query to select the ID, FirstName, LastName, and 
--DateOfBirth of employees whose birthdates are among 
--the latest 4 distinct values (i.e., the youngest employees), 
--ordered ascending by DateOfBirth.

Select Distinct top 4 Employees.DateOfBirth 
from Employees
order by  Employees.DateOfBirth  Desc; 

Select Employees.ID , Employees.FirstName , Employees.LastName,
Employees.DateOfBirth
from Employees 
where Employees.DateOfBirth in
(
Select Distinct top 4 Employees.DateOfBirth 
from Employees
order by  Employees.DateOfBirth  Desc
)
order by  Employees.DateOfBirth asc ;


---------------------------------


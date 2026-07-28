-- Having (DQL)
select Employees.DepartmentID,
Count(DepartmentID) AS CountOfEmps
from Employees 
group by DepartmentID
order by DepartmentID; 

Select Employees.DepartmentID , 
Sum(MonthlySalary)  As 'SUMOfSalaries' 
from Employees 
group by DepartmentID 
having Sum(MonthlySalary) >1000
order by DepartmentID; 

-- another way to use where with group 

Select * from
(
Select Employees.DepartmentID , 
Sum(MonthlySalary)  As 'SUMOfSalaries' 
from Employees 
group by DepartmentID 
) T1
where T1.SUMOfSalaries > 1000
order by DepartmentID asc ; 

-- C1 : Departments with more than 140 employees
Select Employees.DepartmentID 
from Employees
Group by DepartmentID 
Having COUNT(Id) > 140 ;

-- C2 :  Departments where total salaries exceed 20000
Select DepartmentID 
from Employees
Group by DepartmentID
Having Sum(MonthlySalary) > 20000 ;

-- C3 : Years in which more than 50 employees were hired
Select Year(Employees.HireDate) AS Years
From Employees
group by Year(HireDate)
Having Count(ID) > 50 

-- C4 : Departments where the highest salary is ≥ 3000
Select Employees.DepartmentID 
from Employees 
group by DepartmentID
having Max(MonthlySalary) >=3000 ; 

-- C5 : Countries with ≥ 150 employees
Select  CountryID
From Employees
Group by CountryID 
having Count(CountryId) >=150 ; 

-- C6 : Departments where total BonusPerc is greater than 12
Select Employees.DepartmentID 
From Employees 
Group by DepartmentID 
Having Sum(Employees.BonusPerc) > 12 
order by Employees.DepartmentID asc ; 

-- C7 : Departments where the lowest salary is < 210
Select Employees.DepartmentID 
from Employees 
group by DepartmentID
Having Min(MonthlySalary) < 210 ;

-- C8 : Departments with more employees than the average per department
Select DepartmentID As DeptId 
from Employees 
Group by DepartmentID 
Having Count(Employees.ID) > 
(
Select Avg(EmpsCount) 
from
(
Select Count(Employees.ID) As EmpsCount --> table with the count of emps in each dept 
from Employees 
Group By DepartmentID 

) CountOfEachDept

)


--- Like 
Select Distinct FirstName From Employees -- the fname that starts with a 
where FirstName LIKE 'a%'
order by FirstName asc ; 

Select Distinct FirstName -- the fname that ends with a 
From Employees 
where FirstName like '%a'
order by FirstName asc ;

Select Distinct FullName = FirstName+' '+LastName -- Contains specific chars 
from Employees 
where Trim(FirstName+' '+LastName) Like '%tell%' 
order by FullName asc ; 


Select Distinct FullName = FirstName+' '+LastName -- Starts with a and ends with a  
from Employees 
where Trim(FirstName+' '+LastName) Like 'a%a' 
order by FullName asc ; 



Select Distinct FullName = FirstName+' '+LastName -- The second char is a (Index)   
from Employees 
where Trim(FirstName+' '+LastName) Like '__a%' 
order by FullName asc ; 

Select Distinct FullName = FirstName+' '+LastName   
from Employees 
where Trim(FirstName+' '+LastName) Like 'a___%' -- starts with a and have at least 3 chars 
order by FullName asc ; 


Select Distinct FullName = FirstName+' '+LastName   
from Employees 
where Trim(FirstName+' '+LastName) Like 'a__%' -- starts with a and have at least 2 chars 
order by FullName asc ; 


Select Distinct FirstName   -- starts with a or b 
from Employees 
where FirstName Like 'a%' or
FirstName Like 'b%'
order by FirstName asc ; 

-- EX1 : Get All Emps That Their Name Start With a 
Select * From Employees 
where FirstName like 'a%'

-- Ex2 : Get All Emps That Their Name End With b 
Select * From Employees 
where FirstName like '%b'

--- Ex3 : Thier name have 'ah' 
Select * From Employees 
where FirstName like '%ah%'

-- Ex4 : The Third char is m
Select * From Employees 
where FirstName like '__m%'

-- Ex5 : starts with A or B 
Select * From Employees 
where FirstName like '%A'
or  FirstName like '%B'

-- Ex6 : starts with a and ends with d 
Select * From Employees 
where FirstName like '%a%d'

-- Ex7 : the second char is and the forth is m 
Select * From Employees 
where FirstName like '_a_m%'
------------------------------------------------------------------------------
/*
Challenge : The company manager wants a detailed financial report.

Requirements:

1. Display:
   - Total monthly salaries (TotalSum).
   - Average monthly salary (Average).

2. Only include employees who satisfy ALL of the following conditions:
   - The second character of FirstName is 'a'.
   - MonthlySalary is NOT BETWEEN 500 AND 1000.
   - DepartmentID IN (1, 2, 4).

3. Group the results by DepartmentID.

Required Output:
- DepartmentID
- TotalSum
- Average
*/
Select DepartmentID from 
(
Select Employees.DepartmentID 
from Employees
where  
NOT ( MonthlySalary  between 500 and 1000) and 
DepartmentID IN (1, 2, 4) 
and 
Employees.FirstName like '_a%' 
) T 
Group by DepartmentID ;

-- DML
update Employees set FirstName = 'Mohammed' 
where ID = 285 ;

update Employees set FirstName ='Mohammad'
where Id = 286 ; 

update Employees set FirstName ='Mohammoud'
where Id = 287 ; 

------- Wildcard 
/*
 % --> single char , multiple , zero
 _ --> single char 
 [] --> any char in this bracket 
 [^] --> not any in bracket 
 [ - ] --> range of chars in the bracket 
*/

Select Id , Firstname , Lastname 
From Employees 
where Firstname='mohammed' or Firstname='mohammad';  

-- [ الحروف الي شاكك فيها ]
Select Id , Firstname , Lastname 
From Employees 
where Firstname like 'mohamm[ae]d' ;

Select Id , Firstname , Lastname -- ends with a,b,c
From Employees 
where Firstname like '%a' 
or  Firstname like '%b' 
or  Firstname like '%c' 

Select Id , Firstname , Lastname -- ends with a,b,c
From Employees 
where Firstname like '%[abc]' 


Select Id , Firstname , Lastname 
From Employees 
where Firstname like '[a-c]%'-- Starts with any char in this [Range of Chars]
 

 -- Find all employees whose firstname starts with a vowel (A, E, I, O, U).
 Select Firstname , ID 
 from Employees 
 where FirstName like '[a,e,o,u,i]%';

 -- Find all employees whose firstname does not start with a vowel.
  Select Firstname , ID 
 from Employees 
 where FirstName NOT like '[a,e,o,u,i]%';

-- Find all employees whose lastname starts with any letter between 'A' and 'F'.
  Select LastName , ID 
 from Employees 
 where FirstName like '[a-f]%';

 -- Find all employees where the second letter of their firstname is either 'a', 'e', or 'i'.
 Select FirstName, ID 
 from Employees 
 where FirstName like '_[aei]%';

 -- Find any records where the lastname starts with a number (0-9).
  Select Lastname , ID 
 from Employees 
 where Lastname like '[0-9]%';

 -- Find employees whose firstname is exactly 4 characters long, 
 -- starts with 'J', and ends with 'n' (e.g., John, Joan).
  Select FirstName , ID 
 from Employees 
 where FirstName like 'j__n';

 -- Find employees whose lastname does not end with the letters 's' or 'n'.
 Select LastName , ID 
 from Employees 
 where LastName Not like '%[sn]';

--- Find employees whose firstname 
-- contains a letter between 'q' and 'z' anywhere in the name.
 Select FirstName , ID 
 from Employees 
 where FirstName like '%[q-z]%';

 -- Find employees whose firstname starts with 'Ma', 
 -- but the third character is not 'r' (e.g., matching "Matt" but not "Mark").
  Select FirstName , ID 
 from Employees 
 where FirstName like 'Ma[^r]%' ; 

 -- Find employees with a 3-letter firstname that ends in 'y' (e.g., Ray, Guy, Joy)
   Select FirstName , ID 
 from Employees 
 where FirstName like '__y' ; 

 -- Find employees whose lastname has 'a' as the 
 -- second letter and the third letter is anywhere in the range 'm' through 'z'.
 Select LastName , ID 
 from Employees 
 where LastName  like '_a%' and
 LastName  like '__[m-z]%';


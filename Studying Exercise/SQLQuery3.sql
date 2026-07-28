    ---- ----- DDL

-- check before create new database 
if not exists (select * from sys.databases where name ='db3' )
create database db3 ;

-- use db3 ;

use master; 
-- check before drop database 
if exists ( select * from sys.databases where name ='db3') -- لو داتا بيز موجوده اعملها دروب 
drop database db3;

use db2;
 
 --- to create a table 
create table Managers(
ManagerId tinyint not null
,EmpId tinyint not null
, Primary key(ManagerId)
);

create table Engineers(
EngId tinyint not null , level varchar(10) null , programmingLan varchar(100) null
, primary key(EngId) 
);

create table Secratries(
SecId int not null ,
SecName varchar(100) not null ,
SecAge tinyint not null ,
primary key(secId) 
);

create table Test
(
Id int not null ,
Sex char(1) not null ,
IsMarried bit not null,
BirthDate Date not null,
Name varchar(100) not null,
Gpa Decimal not null ,
Salary Decimal not null,
Email varchar(130) not null ,
Age tinyint not null ,
Primary Key (Id) 

);

-- to drop a table 
drop table Secratries ; 
-------------------------------------------------


 -- DDL Alter Table Statement
use database1 ;

create table person
(
name varchar(50) not null
,id int not null
,primary key(id)
);

-- add column to person table
alter table person
add gender char(1) not null ;

alter table person
add BirthDate date not null ; 

alter table person
add Age tinyint not null ; 

alter table person 
add
dependentnames varchar(1000) null ,
mothername varchar(60) null ,
phone char(11) not null ; 

-- rename columns using stored procedure sp_rename
exec sp_rename 'person.id' , 'Id' , 'COLUMN'
exec sp_rename 'person.gender','Gender','Column'
exec sp_rename 'person.dependentnames' , 'DependatNames','COLUMN' 
exec sp_rename 'person.mothername' , 'MotherName' , 'COLUMN'
exec sp_rename 'person.phone' , 'Phone' , 'COLUMN' 
exec sp_rename 'person.name' , 'Name' , 'COLUMN' 
exec sp_rename 'Persons.DependatNames' , 'DependantName' , 'COLUMN' 

-- rename table (stored procedure) 
exec sp_rename 'person' ,'Person'
exec sp_rename 'Person' , 'Persons'
exec sp_rename 'test' , 'Tests' 

-- modify column (change its datatype)
alter table Persons
alter COLUMN Name nvarchar(100) not null ; 

alter table Persons 
alter COLUMN DependatNames nvarchar(500) ; 

alter table Persons
alter COLUMN MotherName nvarchar(100) not null ; 

-- drop column
use database1 ; 
alter table Tests 
drop COLUMN name ; 

alter table Tests
drop COLUMN age ; 

drop table Tests; 

BACKUP DATABASE db2
to Disk = 'D:\Self-Study\Db\Database Backup\db2_Backup.bak';

--- Diffrences on db2 
use db2; 
drop table Test ; 

alter table Managers 
drop COLUMN EmpId ; 

alter table Managers 
add 
ManagerName varchar(60) not null ,
ManagerAge tinyint not null 

-- rename 
exec sp_rename 'Managers.ManagerAge' ,'Age' ,'COLUMN';


--- Defrentail backup
BACKUP DATABASE db2 
to Disk = 'D:\Self-Study\Db\Database Backup\db2_Backup.bak'
with DIFFERENTIAL  ;

use database1 ; 

-- full backup
BACKUP DATABASE database1 To disk = 'D:\Self-Study\Db\Database Backup\Full Backup\Full_Database1.bak';

-- Diff backup
backup database database1 to disk ='D:\Self-Study\Db\Database Backup\Diff\DiffBackup_Database1.bak' with Differential ;

-- Restore db
drop dataBASE database1 ; 
restore database database1
FROM disk = 'D:\Self-Study\Db\Database Backup\Diff\DiffBackup_Database1.bak' ; 

create database db3 ; 
use db3 ; 
create table Ex1
(
x1 int not null ,
x2 varchar(10) null , 
x3 tinyint not null 
);


-- Full backup
Backup database db3 to disk= 'D:\Self-Study\Db\Database Backup\Full Backup\db3_FullBackup';

create table Ex2
(
x1 int not null ,
x2 varchar(10) null , 
x3 tinyint not null 
);

create table Ex3
(
x1 int not null ,
x2 varchar(10) null , 
x3 tinyint not null 
);

create table Ex4
(
x1 int not null ,
x3 tinyint not null 
);


-- Diff backup
Backup database db3 to disk= 'D:\Self-Study\Db\Database Backup\Diff\DiffBackup_Db3' with Differential ;

drop table Ex1 , Ex2 , Ex3 ; 

-- Restore 
use master ; 
drop database db3 ;

Restore database db3 from Disk = 'D:\Self-Study\Db\Database Backup\Full Backup\db3_FullBackup' 
WITH REPLACE,NORECOVERY;

Restore database db3 From disk= 'D:\Self-Study\Db\Database Backup\Diff\DiffBackup_Db3'  
WITH RECOVERY;

--- DDL Alter Table Column
alter table Employees
alter Column HireDate date null ;  --- change the data type of col HireDate 

-- DML = Data Manipulation Language --
use db2; 

-- Insert Single Row 
insert into Employees(Emp_Id,Employees.Name , Employees.Email , Employees.HireDate)
values(1,'Hassan Mohammed','hamo@hotmail.com' , null) ; 

-- Insert Single Row Without Specifing What Will Be Filled 
insert into Employees values(2,'Ahmed Khaled','AkakaAhmedKhaled@hotmail.com','1/1/2026') ;

-- Insert Multiple Rows
insert into Employees(Emp_Id,Name,Email,HireDate) 
values
(3,'Osama Mohamoud','os@gmail.com',null),
(4,'Salam Mohammed','salmoa@gmail.com','12/1/2022'),
(5,'Nada Hamed','nanadHamoud@gamil.com',null); 

-- Insert Multiple Rows Without Specifing What Will Be Filled 
insert into Employees
values
(6,'Malak Ahmed','maaaalak@hotmil.com','2/1/2021'),
(7,'Hossam Ahmed','Hoss@hotmil.com','2/15/2021'); 

-- Pk doesn't allow data duplication or null 'Emp_Id'
-- Please Note That date format is : m/d/y 

Select * from Employees; -- to view all records of this table 

-- Insert Less/More Than What Have Specified 
insert into Employees(Emp_Id,Name,Email)
values(9,'Jomna Khaled','Jk@gmail.com',null); 

-- DDL Add Column
use db2; 
alter table Employees 
add Salary int null ; 

Select * from Employees; 

-- DML UPDATE RECORDS 
update Employees set Employees.Salary=5000 where Employees.Emp_Id=1; 
update Employees set Salary=6000 where Name='Ahmed Khaled' ;

update Employees set Email = 'wwwhdos@gmail.com',Salary=10000 where Emp_Id=3 ; -- change 2 columns at the same time 
update Employees set Name='Salma Mohammed' , Salary =7000 where Emp_Id=4; 

update Employees set Salary=4000 where Salary is Null ; 
update Employees set Salary=Salary+3000 where Salary=4000; 
update Employees set HireDate='12/1/2021' where Emp_Id>=4; 

update Employees set HireDate='4/12/2021' where Emp_Id=3; 
update Employees set HireDate='6/2/2021' where Emp_Id=1; 



--add column
alter Table Engineers add Gender char(1)  null ; 
alter Table Engineers add Framework varchar(20)  null ; 

-- DMl For Enginners Table  --- 
Select * from Engineers; 

insert Engineers(Engineers.EngId,Engineers.level,Engineers.programmingLan)
values(1,'Mid Level','C#,Py,C'); 
update Engineers  set Gender='F' where EngId =1; 
update Engineers set Framework='Danjo'; 

insert Engineers(EngId,level,programmingLan,Gender)
values(2,'Mid-Level','C++','M') ; 

-- Update Both Gender And Framework 
update Engineers set level='Junior',Framework='QT' where EngId=2; 

Insert Engineers(Engineers.EngId,level,Engineers.programmingLan)
values(3,Null,NULL);

Insert Engineers(Engineers.EngId,level,Engineers.programmingLan)
values(4,Null,NULL);
Insert Engineers(Engineers.EngId,level,Engineers.programmingLan)
values(5,Null,NULL);
Insert Engineers(Engineers.EngId,level,Engineers.programmingLan)
values(6,Null,NULL);
Insert Engineers(Engineers.EngId,level,Engineers.programmingLan)
values(7,Null,NULL);
Insert Engineers values(3,'Senior','Py,C++','M',null); 

Select * From Engineers ; 
Insert Engineers values(4,'Senior','Py,C++','M',null); 
Insert Engineers values(5,'Mid','Py,C++','M',null); 
Insert Engineers values(6,'Junior','Py,C++','M',null);
Insert Engineers values(7,'Senior','Py,C++','M',null); 
Insert Engineers values(8,'Senior','Py,C++','M',null); 

update Engineers set Framework='.Net Core' where EngId=3; 

insert Engineers values(3,'Intern','Py(Sk Learn , Numpy , Panda)' ,'F','Ml'); 

update Engineers set EngId=3 where EngId=2; 

update Engineers set EngId=2 where EngId=4; 

Insert Engineers(EngId) values(4) ;

-- Dml Delete Columns 

delete from Engineers
where level is NUll and programmingLan is Null and Gender is Null and Framework is Null ; 

delete From Engineers
where Framework is NUll and EngId>=6 and EngId<=8; 

delete from Engineers where Level is Null ; 

delete from Engineers where Framework is Null ; 
drop table EngineersNames;

delete from EngineersNames where EngId=2 or EngId=3; 
update EngineersNames set EngId=2 where Name='Ahmed Khaled' ; 
update EngineersNames set EngId=3 where Name='Osama Mohamoud' ; 

update EmpHire set HireDate='10/8/2020' where Name='Salma Mohammed'; 

update EmpHire set HireDate= Null  where HireDate='12/1/2021'; 

alter table NullEmpHire add  Gender char(1) null ; 

update NullEmpHire set Gender='F' where Name='Nada Hamed' or Name='Malak Ahmed' or Name='Jomna Khaled'  ;

update NullEmpHire set Gender='M' where Name = 'Hossam Ahmed'; 

-- Copy Data From Table TO New Table(this table isn't created yet)  

select * into EnginnersCopy From Engineers; -- will create table named 'EnginnersCopy' based on the selected columns 
Select * into EnginnersCopy from Employees; -- you should insert into non-existing table

Select Engineers.EngId , Employees.Name into EngineersNames from Engineers,Employees -- select specific columns 
where Engineers.EngId<=3 and Employees.Emp_Id<=3 ;

Select Employees.Name,Employees.HireDate into EmpHire from Employees;

Select EmpHire.Name , EmpHire.HireDate into NullEmpHire from EmpHire where HireDate is Null ; 


drop table ExistingTestTable; 

create table ETable ( id int not null  , Primary Key(id)) ; 

-- copy Columns of table without data 
Select * into ExistingTestTable2 from Employees where 5=9; 
Select  * from ExistingTestTable2 ; 

use db2; 

ALTER TABLE ETable
DROP CONSTRAINT PK__ETable__3213E83FD1E63760;

EXEC sp_help 'ETable';

alter table ETable drop COLUMN id; 
Select  * from ETable ; 

Select * from ExistingTestTable; 


Select * into Emps2 from Employees where Salary>=5000; 

Select * From Emps2; 

-- Copy Data From Table TO Exsiting Table(this table was created ) -------

-- Copy columns from table to new existing table (the same structure) 
Insert into ExistingTestTable --> existing table 
select * from Employees where Salary <=5000; 

-- Copy Columns From Table To Existing Table (not the same structure)

Insert Into ExistingTestTable2 --Column name or number of supplied values does not match table definition.
Select  * from EmpHire ; 

Insert Into ETable --Column name or number of supplied values does not match table definition.
Select  * from EmpHire ; 

Insert Into Emps2 
Select * From Employees; 

Select * From Emps2 ;


 -- divide employees table into 2 tables

 Select Employees.Emp_Id,Employees.Name,Employees.Salary into EmpsSummary
 from Employees; 

 Select * From EmpsSummary;


 Select Employees.Emp_Id,Employees.Name,Employees.Salary 
 into EmpsSummary1
 from Employees where 9=8 ; 

  Select Employees.Emp_Id,Employees.Name,Employees.Salary 
 into EmpsSummary2
 from Employees where 9=8 ; 

 Select * From EmpsSummary1; 
 
 Select * From EmpsSummary2; 

 insert into EmpsSummary1 
 select * from EmpsSummary where EmpsSummary.Emp_Id<=4; 

 insert into EmpsSummary2
 select * from EmpsSummary where EmpsSummary.Emp_Id>=4; 

 --dml rr
delete from EmpsSummary2 where Emp_Id=5; 
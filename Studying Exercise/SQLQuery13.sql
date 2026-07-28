use db3 ;
drop table  Customers ;
Drop Table Orders ; 

-- DDL 
Create Table Person
(
PersonId int Identity(1,1) Not null ,
FirstName varchar(30) not null ,
LastName varchar(30) not null ,
DateOfBirth Date not null ,
Constraint PK_PersonId  Primary Key(PersonId) 
);


Create Table Vechile
(
VechileId int Identity(1,1)  Not null ,
ModelName varchar(30) not null ,
Constraint PK_ModelVechileId Primary Key(VechileId,ModelName)
);

Create Table Employees
(
EmpId int Identity(1,1) not null , 
DepartmentId int null ,
HireDate Date null
);

Alter Table Employees Add PersonId int not null ; 

Alter Table Employees Add
Constraint FK_EmpIsA_Person Foreign Key (PersonId) 
References Person(PersonId) ;

Alter Table Employees Drop
Constraint Fk_PersonIsA_Emp ;

-- Add Col As PK 
alter Table Employees ADD 
Constraint PK_EmpId Primary Key (EmpId) ; 

-- Drop PK Constraint 
Alter Table Employees
Drop CONSTRAINT Pk_EmpId ; 


Create Table Cars 
(
CarId int Identity(1,1) not null ,
ModelNum int not null  , 
ModelName varchar(30) null , 
VechileId int null ,
Constraint FK_VechileId Foreign Key (VechileId,ModelName)
REFERENCES Vechile(VechileId,ModelName) 
);

create Table Ex 
( 
ID int Identity(1,1) not null , 
PersonId int null 
Constraint FK_PersonId Foreign Key(PersonId) 
References Person(PersonId) 

Constraint PK_Id Primary Key(ID) 
);

Alter Table Ex Add 
Model Int not null ; 

Alter Table Ex 
Alter COLUMN Model Int Null ; 
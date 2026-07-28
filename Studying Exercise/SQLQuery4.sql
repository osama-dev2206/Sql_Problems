--- DDL 
Create Database db4 ;
use db4;

create table Employees -- Parent Table 
(
EmpId int not null Primary Key,
HireDate date null , 
Name varchar(100) not null , 
Email varchar(50) null 
);

Create Table Managers
(
MangerId int not null Primary Key ,
NameDept varchar(100) not null 
);


alter table Managers 
Add 
EmpId int null , 
Foreign Key(EmpId) REFERENCES Employees(EmpId);


CREATE TABLE Enginners (
    EngId              INT          NOT NULL PRIMARY KEY,
    level              VARCHAR (8)  NULL,
    EmpId              INT          NULL FOREIGN KEY REFERENCES Employees (EmpId),
    ProgammingLanguage VARCHAR (50) NULL
);


Select Enginners.level , EmpId , ProgammingLanguage
into Enginners2 from Enginners; 

drop table Enginners;

exec sp_rename 'Enginners2' ,'Enginners';

alter table Enginners  
add  EngId int IDENTITY(1,1) not null Primary Key   ; 

alter table Enginners 
ADD FOREIGN KEY(EmpId) REFERENCES Employees(EmpId);

Select * from Enginners ; 
---------------------------------------------------------------------------
create database db5; 
use db5;

Create Table Students
(
StudentId int Identity(1,1) not null Primary Key,
Email varchar(50) null ,
Name Varchar(100) not null 
);

Create Table Courses
(
CourseId int Identity(1,1) not null Primary Key,
Credit int not null ,
CourseName Varchar(100) not null 
);

-- Junction Table 
Create Table Enrollments
(
EnrollId int Identity(1,1) not null Primary Key,
CourseId int REFERENCES  Courses(CourseId) ,
StudentId int REFERENCES Students(StudentId) ,
Semester varchar(10) not null ,
Grade int null 
);
use master ; 

use  db4 ; 

create table Vechile
(
Vin int not null identity(1000,500) Primary Key ,
Model varchar(200) not null ,
PYear date null 
);

--> Generalization
Create Table Car
(
CarId int not null Identity(199,100) Primary Key ,
Vin int null REFERENCES Vechile(Vin) , 
NumBody int not null ,
BodyType varchar(100) not null 
);

create table Truck 
(
TruckId int identity(100,100) not null Primary Key ,
Vin int null REFERENCES Vechile(Vin) , 
PayloadCapacity float not null 
);

---> Specialization 
create Table Ambulance --> ambulance is type of car 
(
AmbulanceId int not null Identity(200,200) Primary Key ,
TheDriverOfTheAmbulance varchar(100) null 

);

alter Table Ambulance 
add
 CarId int not null ,
Foreign Key(CarId) References Car(CarId); 
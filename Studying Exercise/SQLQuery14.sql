
-- Default Constraint 
Create Table City  -- DDL 
(
 CityId int Identity(1,1) not null ,
 CityName varchar(40) not null Default 'Cairo' 
 Constraint PK_CityId Primary Key(CityId) 
);

alter TABLE City ADD 
CityPopulationNum int null Default 0 ;

Select * From City ;  -- DQL 

Insert Into City(City.CityName) -- DML 
values ('10Th Of Ramadan'); 


Insert Into City(City.CityName) -- DML 
values ('New Cairo City'); 

--Create a table Students with columns:
--ID → primary key
--Name → not null
--Age → not null
--Country → default value = 'Cairo'

create Table Students 
(
ID int not null Identity(1,1) , 
Name varchar(100) not null , 
Age int not null ,
Country Varchar(40) not null 
Constraint Df_Cty  Default('Utopia') ,
Constraint PK_Id Primary Key(ID) 
);

Insert INTo Students (Name,Age)
values('Ahmed Khaled',20) 

alter Table Students Drop Column City ;

alter Table Students ADD 
City Varchar(50) 
Constraint DF_City Default('Unknown'); 

Insert INTo Students (Name,Age)
values('Ola Khaled',50) 

Alter Table Students Drop Constraint DF_City ; 
Alter Table Students Drop Constraint DF_Cty ; 

Select * From Students ; 

-- Check Contraint 
Create Table Person
(
Id int Identity(1,1) Not Null 
Constraint PK_IdPerson Primary Key(Id) ,
FirstName varchar(30) not null ,
LastName varchar(30) not null ,
CityName varchar(100) not null 
Constraint Df_City Default('Cairo') ,
CountryName varchar(10) not null 
Constraint Chk_CountryName 
Check(CountryName='Egypt' or CountryName='Egy')

);

Select * From Person ;

Insert Into Person values('Ahmed','Omar','Zagaizag','Egy') ;

Create Table Ex 
(
Id int identity(1,1) not null Primary Key ,
Name Varchar(50)  ,
Constraint CHK_ColumnOfEx Check(Id<>0 and (Name is not null or Name='a' ) ) 
);

Select * From Ex ;
Insert Into Ex values('a');

Alter Table Ex 
Drop Constraint CHK_ColumnOfEx ; 

--Create a table Products with:
--ProductID → primary key
--ProductName → not null
--Price → must be greater than 0
--Stock → must be 0 or more
create Table Products 
(
ProductId int not null Identity(1,1)
Constraint PK_ProId Primary Key(ProductId) ,
ProductName varchar(1000) not null , 
Price int not null ,
Stock int null ,
Constraint Chk_Avalabilty Check(Price>=0 and Stock>=0 )
);

Select * From Products ;
Insert Into Products 
Values('Test',0,0) ;

Truncate Table Products ;

Alter Table Products ADD
Constraint Chk_Row check(ProductId >0) ;

 -- 
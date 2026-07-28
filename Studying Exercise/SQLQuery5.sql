drop table Ex1,Ex2,Ex3,Ex4;

-- DDL 
Create Table Customers
(Id int not null Primary Key , CustomerName varchar(100) not null , 
CustomerAddress varchar(200) null  );

-- add Id(PK of customers table as FK in orders table) 
create Table Orders
( OrderId int not null Primary Key , OrderDate Date null ,
CustomerId int references Customers(Id) );


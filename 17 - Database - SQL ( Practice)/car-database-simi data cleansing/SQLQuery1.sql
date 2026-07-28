Select * From dbo.CarsData

select CarsData.Make , CarsData.Model
From CarsData 
Group By Model , Make;

--Get all cars from a specific manufacturer.
select CarsData.Make , CarsData.Model
From CarsData 
where Make ='BMW';
--Show cars available in a specific year.
select CarsData.Make , CarsData.Model
From CarsData 
where year =2010;
--Count the number of cars for each body type.
Select CarsData.Body , Count(*) as count_of_body 
From CarsData 
Group by Body ;
--Show all cars with a specific number of doors.
Select CarsData.Body , NumDoors  
From CarsData 
Group by NumDoors , Body
Having CarsData.NumDoors > 2;

Select * from  CarsData ; 

alter Table CarsData  -- edit existing column 
Alter COLUMN ymm_id bigint not null   ;

alter Table CarsData -- set the first column as pk 
Add Constraint PK_ymm_id Primary Key (ymm_id) ;

-- spearate make from table
Create Table Makes
(
MakeId int not null Primary Key identity(1,1), 
MakeName nvarchar(50) not null unique 
);
-- insert makes name 
Insert into Makes
Select Distinct Make From CarsData 
order by Make asc;

Select * From Makes ; -- check inserted data 

-- insert new record in cars data ( will be fk that ref of makes table )
alter table CarsData
add
MakeOfCarId int  null Foreign Key References Makes(MakeId) ;

Select * from  CarsData ; 

-- change the data from null to valid data 
update  CarsData
Set MakeOfCarId =
(Select Makes.MakeId from Makes where CarsData.Make = Makes.MakeName) 
where MakeOfCarId IS Null;

-- change the column to allow not null only 
alter table CarsData
Alter Column MakeOfCarId  int not null ;

-- drop unnessary redundant data Column
Alter Table CarsData
Drop COLUMN Make ;

--- spearate model to another table 
create Table Models
(
ModelId int not null Primary Key Identity(1,1) ,
ModelName nvarchar(50) not null 
);

-- copy data to new table 
Insert Into Models
Select Distinct  CarsData.Model 
From CarsData Order By Model Asc ;

Select * From Models ;

Alter Table CarsData 
Add ModelId int  null Foreign Key 
References Models(ModelId);

-- insert value in column according to models table id
Update CarsData 
Set CarsData.ModelId = 
(Select Models.ModelId 
From Models Where Model = Models.ModelName)
where CarsData.ModelId is null ;

-- drop the unncessary column
Alter Table CarsData 
Drop Column Model ; 

Select * from  CarsData ; -- to check 
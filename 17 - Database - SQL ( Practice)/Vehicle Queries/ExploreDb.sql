EXEC sp_changedbowner 'sa'; -- to change the permissions to system adminstrator

Select * From VehicleDetails; 

Select * From SubModels ;

select distinct Makes.Make , VehicleDetails.Vehicle_Display_Name as CarName 
From VehicleDetails
Inner Join SubModels  
On SubModels.SubModelID = VehicleDetails.SubModelID
Inner Join MakeModels 
On MakeModels.ModelID = SubModels.ModelID
Inner Join Makes On MakeModels.MakeID = Makes.MakeID;

Select * from DriveTypes ;

Create view TempCar as 
Select VehicleDetails.Vehicle_Display_Name as CarName  
From VehicleDetails
Inner Join DriveTypes
ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
where Vehicle_Display_Name like '%2010%';

Select Count(*) from TempCar ;

Select SubModels.SubModelName From SubModels;

Select VehicleDetails.Vehicle_Display_Name as CarName , 
VehicleDetails.Year , SubModels.SubModelName 
From VehicleDetails
Inner Join SubModels
ON VehicleDetails.SubModelID = SubModels.SubModelID
where SubModelName ='Base' and Year between 2000 and 2003 
order by Year asc ; 

create view CarNameSubModelName as 
Select VehicleDetails.Vehicle_Display_Name as CarName , 
VehicleDetails.Year as Years, SubModels.SubModelName 
From VehicleDetails
Inner Join SubModels
ON VehicleDetails.SubModelID = SubModels.SubModelID ; 

Select CarNameSubModelName.*
,VehicleDetails.NumDoors From VehicleDetails
Inner Join CarNameSubModelName ON
CarNameSubModelName.CarName = VehicleDetails.Vehicle_Display_Name
where NumDoors Is not NULL and NumDoors >0 
order by NumDoors asc ;

Select NumDoors
From VehicleDetails
Where Vehicle_Display_Name = 'American LaFrance ALF Eagle 2006 Base';

-- Denormalization 
alter Table VehicleDetails
Add 
Constraint FK_MakeId Foreign Key (MakeID)
References Makes(MakeID) ;

-- Denormalization 
Alter Table VehicleDetails
Add Constraint FK_ModelId Foreign Key (ModelID)
References MakeModels(ModelID) ;

-- Take Look On Tables 
Select * From FuelTypes ;
Select * From MakeModels;
Select * From SubModels;
Select * From Makes ;
Select * From Bodies;
Select * From DriveTypes;


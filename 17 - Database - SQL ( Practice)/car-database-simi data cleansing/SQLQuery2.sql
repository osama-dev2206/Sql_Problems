Select * From CarsData ;
Select * From Makes ; 

-- spearate submodel 
create Table SubModels 
(
SubModel_ID bigint not null identity(1,1) Primary Key , 
SubModelName nvarchar(100)
);


Insert Into SubModels (SubModelName)
Select Distinct Submodel From CarsData order by Submodel; 

Select * From SubModels ;



alter Table CarsData
Alter COLUMN SubModelId bigint null ; 

Alter table CarsData 
add
Constraint FK_SubModels
Foreign Key(SubModelId) References SubModels(SubModel_ID);
 
 Select * from CarsData ;

 Update CarsData 
 Set SubModelId =
 (Select SubModels.SubModel_ID From SubModels 
 Where CarsData.Submodel = SubModels.SubModelName );

 Alter Table CarsData 
 Drop COLUMN Submodel;


 -- Benfits ? 
 -- 1. remove data redundancy 
 -- 2. make the data easier to update 
 -- 3. enhance query perfromance 

 create Table Cylinders 
 (
 CylinderId bigint not null Primary Key Identity(1,1) , 
 CylinderName nvarchar(10) 
 );

 Insert Into Cylinders(CylinderName)
 Select Distinct CarsData.Cylinder_Type_Name
 From CarsData order by Cylinder_Type_Name asc ;

 Select * From CarsData ;

 Update CarsData
 Set CarsData.Cylinder_ID  = 
 (select CylinderId from Cylinders 
 where  Cylinders.CylinderName = CarsData.Cylinder_Type_Name ) ;

 alter Table CarsData
 Drop Column Cylinder_Type_Name;

 alter table CarsData
 ADD CONSTRAINT FK_Cylinder 
 Foreign Key(Cylinder_ID) References Cylinders(CylinderId) ;


Create View MasterVehiclesDetails
AS 
Select VehicleDetails.MakeID , Makes.Make ,
VehicleDetails.ModelID , MakeModels.ModelName ,
VehicleDetails.SubModelID , SubModels.SubModelName ,
VehicleDetails.BodyID , Bodies.BodyName ,
VehicleDetails.Vehicle_Display_Name ,VehicleDetails.Year ,
VehicleDetails.DriveTypeID , DriveTypes.DriveTypeName ,
VehicleDetails.Engine , VehicleDetails.Engine_CC ,
VehicleDetails.Engine_Liter_Display ,
VehicleDetails.FuelTypeID , FuelTypes.FuelTypeName ,
VehicleDetails.NumDoors
From VehicleDetails
INNER JOIN MakeModels ON VehicleDetails.MakeID = VehicleDetails.MakeID
Inner Join SubModels ON SubModels.SubModelID = VehicleDetails.SubModelID
Inner Join Bodies ON VehicleDetails.BodyID = Bodies.BodyID
Inner Join DriveTypes ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
Inner Join FuelTypes On FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
Inner Join Makes On Makes.MakeID = VehicleDetails.MakeID; 
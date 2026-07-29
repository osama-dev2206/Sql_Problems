Select Count(*) As Total 
From 
(
Select Distinct Makes.Make , FuelTypes.FuelTypeName
From VehicleDetails 
Inner Join Makes On Makes.MakeID = VehicleDetails.MakeID
Inner Join FuelTypes On FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
Where  FuelTypeName = N'Gas' 
)T ; 

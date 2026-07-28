Select Makes.Make , FuelTypes.FuelTypeName ,
Count(*) NumOfVehicles 
From VehicleDetails 
INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID 
Inner Join FuelTypes ON FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
where Year Between 1950 and 2000
Group by
Makes.Make, FuelTypes.FuelTypeName
order by Make asc ;
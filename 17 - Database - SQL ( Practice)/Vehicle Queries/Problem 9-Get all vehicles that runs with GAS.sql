Select VehicleDetails.* , FuelTypes.FuelTypeName
From VehicleDetails 
Inner Join FuelTypes On FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID
Where FuelTypeName =N'Gas' ; -- use N with nvarchar column to search about Unicode
Select Count(*) as TotalWithNoSpecifiedDoors    
From VehicleDetails 
Where VehicleDetails.NumDoors IS NULL;
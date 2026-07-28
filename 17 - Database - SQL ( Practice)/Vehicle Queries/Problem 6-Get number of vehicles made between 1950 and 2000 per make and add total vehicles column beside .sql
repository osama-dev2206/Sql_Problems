Select MasterVehiclesDetails.Make , Count(*) NumOfVehicles ,
TotalAtAll = (Select Count(*) From VehicleDetails ) -- you can write query as column
From MasterVehiclesDetails
Where Year between 1950 and 2000 
Group BY Make ;
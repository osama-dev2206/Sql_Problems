Select * , 
Perc = CAST (T.NumberOfVechicles AS Float)  / Cast (TotalAtAll AS Float)
From 
(
Select MasterVehiclesDetails.Make ,
NumberOfVechicles = Count(*)  , 
TotalAtAll = (Select Count(*) From VehicleDetails ) 
From MasterVehiclesDetails 
Where MasterVehiclesDetails.Year between 1950 and 2000 
Group By Make
)T ; 
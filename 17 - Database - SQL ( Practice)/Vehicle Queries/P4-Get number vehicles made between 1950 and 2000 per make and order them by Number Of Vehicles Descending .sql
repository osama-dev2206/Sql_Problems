Select Makes.Make 
,Count(*) As NumberOfVehicles
From VehicleDetails
Inner Join Makes ON VehicleDetails.MakeID = Makes.MakeID
Where VehicleDetails.Year between 1950 and 2000 
Group By Makes.Make
Order by NumberOfVehicles desc ;


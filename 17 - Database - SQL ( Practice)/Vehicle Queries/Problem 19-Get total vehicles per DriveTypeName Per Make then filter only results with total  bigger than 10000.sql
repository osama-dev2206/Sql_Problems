--Get total vehicles per 
--DriveTypeName 
--Per Make then filter only results with total > 10,000
Select * From 
(
Select Distinct Makes.Make ,DriveTypes.DriveTypeName , 
Count(*) as [total vehicles]
From VehicleDetails
INNER JOIN DriveTypes ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
INNER JOIN Makes ON Makes.MakeID = VehicleDetails.MakeID
Group by  Makes.Make ,  DriveTypeName
)RT
Where [total vehicles] > 10000
Order By Make Asc ,
[total vehicles] DESC;





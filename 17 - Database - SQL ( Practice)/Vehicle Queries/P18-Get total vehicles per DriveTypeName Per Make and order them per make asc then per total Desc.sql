-- Get total vehicles
-- per 
-- DriveTypeName Per Make and 
-- order them per make asc then per total Desc
Select Distinct Makes.Make,DriveTypes.DriveTypeName , Count(*) as [total vehicles]
From VehicleDetails
Inner Join DriveTypes ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
Inner Join Makes On Makes.MakeID = VehicleDetails.MakeID
Group by DriveTypeName , Makes.Make
order by  Make Asc ,
[total vehicles] Desc 
--------


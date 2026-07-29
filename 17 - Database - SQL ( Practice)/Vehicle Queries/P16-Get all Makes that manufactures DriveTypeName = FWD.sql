-- Get all Makes that manufactures DriveTypeName = FWD
Select Distinct Makes.Make , DriveTypes.DriveTypeName
From VehicleDetails
Inner Join Makes On Makes.MakeID = VehicleDetails.MakeID
Inner Join DriveTypes ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
Where DriveTypeName = 'FWD'




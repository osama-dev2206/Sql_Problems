-- Get total Makes that Mantufactures DriveTypeName=FWD
Select Count(*) AS Total 
From 
(
Select Distinct Makes.Make , DriveTypes.DriveTypeName
From VehicleDetails
Inner Join Makes On VehicleDetails.MakeID = Makes.MakeID
Inner Join DriveTypes On DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
Where DriveTypeName = 'FWD'
) RT
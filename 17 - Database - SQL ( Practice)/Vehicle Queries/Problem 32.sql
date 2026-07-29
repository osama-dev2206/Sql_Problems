Select * From
(
Select VehicleDetails.Vehicle_Display_Name , VehicleDetails.Year,
Age = DateDiff(year , VehicleDetails.Year , GetDate() )   
From VehicleDetails
)T
Where Age between 15 and 25 ; 
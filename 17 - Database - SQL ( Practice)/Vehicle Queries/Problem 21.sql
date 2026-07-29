Select VehicleDetails.Vehicle_Display_Name , VehicleDetails.Year, 
Age = DateDiff(year ,VehicleDetails.Year,GetDate() )
From VehicleDetails
order By Age Desc 
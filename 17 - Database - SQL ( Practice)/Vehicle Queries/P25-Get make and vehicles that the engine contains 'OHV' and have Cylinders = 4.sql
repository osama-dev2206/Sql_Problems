Select Makes.Make , VehicleDetails.Engine , VehicleDetails.Engine_Cylinders
From VehicleDetails 
Inner Join Makes ON Makes.MakeID = VehicleDetails.MakeID
Where Engine like  '%OHV%' and Engine_Cylinders =4 


Select VehicleDetails.* 
From VehicleDetails
Where Engine_CC > 
(Select Avg(VehicleDetails.Engine_CC) As AvgCC From VehicleDetails)
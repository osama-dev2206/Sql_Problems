Select VehicleDetails.* 
From VehicleDetails
Where VehicleDetails.Engine_CC <
(Select Avg(VehicleDetails.Engine_CC) From VehicleDetails);
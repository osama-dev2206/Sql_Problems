Select VehicleDetails.* 
From VehicleDetails
Where VehicleDetails.Engine_CC in 
(Select Max(VehicleDetails.Engine_CC)  From VehicleDetails);
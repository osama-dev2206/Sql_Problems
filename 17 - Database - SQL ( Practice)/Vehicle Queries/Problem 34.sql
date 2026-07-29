Select VehicleDetails.* 
From VehicleDetails
where VehicleDetails.Engine_CC in 
(Select MIN(VehicleDetails.Engine_CC)as MinCC From VehicleDetails) ;
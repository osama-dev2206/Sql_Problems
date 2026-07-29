Select VehicleDetails.* 
From VehicleDetails
Where Engine_CC in
-- Get 3 top cc 
( 
Select Distinct Top 3 Engine_CC From VehicleDetails
Order By Engine_CC DESC
)
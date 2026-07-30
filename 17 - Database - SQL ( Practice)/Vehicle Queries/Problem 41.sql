--Get all Makes that manufactures one of the Max 3 Engine CC

Select Distinct Makes.Make 
From VehicleDetails 
Inner Join Makes On Makes.MakeID = VehicleDetails.MakeID
Where VehicleDetails.Engine_CC 
in
(
-- Top 3 Engines CC
Select Distinct Top 3 VehicleDetails.Engine_CC
From VehicleDetails
Order by VehicleDetails.Engine_CC Desc
)
Order By Make; 



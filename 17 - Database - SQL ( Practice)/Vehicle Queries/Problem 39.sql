Select Top 3 (VehicleDetails.Engine_CC) as Top3
From VehicleDetails
Group By Engine_CC
Order BY Engine_CC Desc 

--0------

Select Distinct Top 3 (VehicleDetails.Engine_CC) as top3
From VehicleDetails
Order BY Engine_CC Desc 

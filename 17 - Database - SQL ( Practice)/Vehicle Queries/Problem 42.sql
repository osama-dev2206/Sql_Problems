
-- Get a table of unique Engine_CC and calculate tax per Engine CC as follows:
	-- 0 to 1000    Tax = 100
	-- 1001 to 2000 Tax = 200
	-- 2001 to 4000 Tax = 300
	-- 4001 to 6000 Tax = 400
	-- 6001 to 8000 Tax = 500
	-- Above 8000   Tax = 600
	-- Otherwise    Tax = 0
Select Engine_CC ,
Case 
	When (Engine_CC between 0 and 1000) Then 100
	When (Engine_CC between 1001 and 2000) Then 200
	When (Engine_CC between 2001 and 4000) Then 100
	When (Engine_CC between 4001 and 6000) Then 400
	When (Engine_CC > 8000 ) Then 600
	Else 0 
End
AS TAX 
From 
(Select Distinct VehicleDetails.Engine_CC From VehicleDetails)TR
Order By Engine_CC Desc ;

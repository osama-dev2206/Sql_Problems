Select VehicleDetails.Vehicle_Display_Name , VehicleDetails.NumDoors ,
[Door Description] =
CASE 
	When NumDoors=0 Then 'Zero Door'
	When NumDoors=1 Then 'One Door'
	When NumDoors=2 Then 'Two Doors'
	When NumDoors=3 Then 'Three Doors'
	When NumDoors=4 Then 'Four Doors'
	When NumDoors=5 Then 'Five Doors'
	When NumDoors=6 Then 'Six Doors'
	When NumDoors=7 Then 'Seven Doors'
	When NumDoors=8 Then 'Eight Doors'
	When NumDoors Is Null Then 'Not Set'
	Else 'Unknown'

END

From VehicleDetails
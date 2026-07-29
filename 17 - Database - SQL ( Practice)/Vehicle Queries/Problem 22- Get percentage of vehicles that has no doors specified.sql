-- Per = (partial / total) * 100

Select Percentage = 
CAST( (Select Count(*) From VehicleDetails Where NumDoors Is Null) as float )
/
Cast( (Select Count(*) From VehicleDetails ) as float ) 


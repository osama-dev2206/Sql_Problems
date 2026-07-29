--Get all vehicles that their Body is 'Coupe' or 'Hatchback' or 'Sedan'
Select * From VehicleDetails
Inner Join Bodies On Bodies.BodyID = VehicleDetails.BodyID
Where BodyName in ('Coupe'  ,'Hatchback' , 'Sedan' )
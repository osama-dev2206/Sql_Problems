-- Get all vehicles that their body is 'Sport Utility' and Year > 2020
Select * From VehicleDetails
Inner Join Bodies ON Bodies.BodyID = VehicleDetails.BodyID
Where  BodyName= 'Sport Utility' and Year > 2020 
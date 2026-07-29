--Get all vehicles that their body is 
--'Coupe' or 'Hatchback' or 'Sedan' and
--manufactured in year 2008 or 2020 or 2021
Select  * From VehicleDetails
Inner Join Bodies On Bodies.BodyID = VehicleDetails.BodyID
Where BodyName in ('Coupe', 'Hatchback','Sedan') and
VehicleDetails.Year in (2008,2020,2021) 
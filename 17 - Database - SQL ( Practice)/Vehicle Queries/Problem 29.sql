Select Found=1 
Where Exists
(
Select top 1 R=1 From VehicleDetails where Year = 1950 
);
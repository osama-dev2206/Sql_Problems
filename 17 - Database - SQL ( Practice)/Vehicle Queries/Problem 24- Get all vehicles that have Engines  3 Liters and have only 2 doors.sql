--Get all vehicles that have Engines > 3 Liters and have only 2 doors
Select Vehicle_Display_Name,VehicleDetails.Engine_Liter_Display
From VehicleDetails
where VehicleDetails.Engine_Liter_Display>3 and NumDoors =2 



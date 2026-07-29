Select *
From 
(
Select Makes.Make , Count(*) Count_Of_Vehicles
From VehicleDetails
Inner Join Makes ON Makes.MakeID = VehicleDetails.MakeID
Group By Make
)T
Where Count_Of_Vehicles > 20000 
Order By Count_Of_Vehicles Desc 
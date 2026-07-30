--Get Make and Total Number Of Doors Manufactured Per Make
Select * 
From 
(
Select Makes.Make , Sum(NumDoors) As [Total Number Of Door]
From VehicleDetails AS TR
INNER Join Makes On Makes.MakeID = TR.MakeID
Group By Make
)R
Where Make=N'Ford'

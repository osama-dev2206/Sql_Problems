Select Makes.Make , Count(*) Num_Of_Vehicles  -- 16ms Exec
From VehicleDetails 
Inner Join Makes ON Makes.MakeID = VehicleDetails.MakeID
Where VehicleDetails.Year between 1950 and 2000 
Group by Make 
Having Count(*) > 12000 
Order By Num_Of_Vehicles Desc;

---- Without Having 
Select * From  -- 12ms Exec
(
Select Makes.Make , Count(*) [Count Of Vehicles]
From VehicleDetails 
INNER Join Makes ON
Makes.MakeID = VehicleDetails.MakeID 
Where VehicleDetails.Year between 1950 and 2000
Group by Make
)T
Where [Count Of Vehicles] > 12000 
Order By [Count Of Vehicles] Desc ;


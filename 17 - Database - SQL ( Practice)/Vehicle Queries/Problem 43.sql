Select Makes.Make , SUM(VehicleDetails.NumDoors) AS total_num_Of_doors
From VehicleDetails
Inner Join Makes On Makes.MakeID = VehicleDetails.MakeID
Group by Make
order by total_num_Of_doors desc ;



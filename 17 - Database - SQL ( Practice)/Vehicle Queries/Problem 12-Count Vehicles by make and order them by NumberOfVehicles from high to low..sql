Select Count(*) From Makes ; -- get the num of makes 

Select VehicleDetails.MakeID , VehicleDetails.Vehicle_Display_Name
From VehicleDetails

Select Makes.Make , VehicleDetails.Vehicle_Display_Name
From VehicleDetails
Inner Join Makes 
On Makes.MakeID = VehicleDetails.MakeID;

--- Final Solution 
Select Makes.Make ,Count(*) As Vehicle_Numbers 
From VehicleDetails
Inner Join Makes 
On Makes.MakeID = VehicleDetails.MakeID
Group BY Makes.Make 
order by Vehicle_Numbers DESC ;





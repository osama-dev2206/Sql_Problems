--Get MakeID , Make, SubModelName for all vehicles 
--that have SubModelName 'Elite'
Select DISTINCT VehicleDetails.MakeID , Makes.Make ,
SubModels.SubModelName 
From VehicleDetails
Inner Join SubModels ON SubModels.SubModelID = VehicleDetails.SubModelID
Inner Join Makes ON Makes.MakeID = VehicleDetails.MakeID
Where SubModelName = 'Elite'
order by MakeID;
-----------

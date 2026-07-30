--Get the highest number of models manufactured
-- num of models per make 
Select Max(T.NumOfModels) AS [highest number of models manufactured]
From
(
Select Makes.Make , Count(MakeModels.ModelID) As NumOfModels
From MakeModels
Inner Join makes On MakeModels.MakeID = Makes.MakeID
Group by Make

)T ;







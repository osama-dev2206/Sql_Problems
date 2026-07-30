--Get the Lowest Manufacturers manufactured the lowest number of models ,
--remember that they 
--could be more than one manufacturer have the same lowest number of models

Select Makes.Make , Count(MakeModels.MakeId) AS [lowest number of models]
From MakeModels
Inner Join Makes ON Makes.MakeID = MakeModels.MakeID 
Group by Makes.Make 
Having Count(MakeModels.MakeId) = 
(

Select Min(NumOfModelsPerMake) AS LowestNum
From 
(
Select  Count (MakeModels.ModelID) AS NumOfModelsPerMake 
From MakeModels
Inner JOIN Makes ON Makes.MakeID = MakeModels.MakeID
Group By Make
) R

)


--------------------------

							
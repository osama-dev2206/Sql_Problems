--Get the highest Manufacturers 
--manufactured the highest number of models 
--, remember that they could be more than one manufacturer 
--have the same high number of models

Select Makes.Make , Count(MakeModels.ModelId) as [Num Of Models]
From MakeModels 
Inner Join Makes On Makes.MakeID = MakeModels.MakeID
Group by Make 
Having Count(MakeModels.ModelId) =
(

Select Max( [Num Of Models] ) As MaxNum -- max num of models 
From 
(
Select 
Count(MakeModels.ModelId) as [Num Of Models]
From MakeModels 
Inner Join Makes On MakeModels.MakeID = Makes.MakeID
Group By Make 
) R

) 


-----------


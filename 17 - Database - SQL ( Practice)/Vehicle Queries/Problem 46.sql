--Get the highest 3 manufacturers that make the highest number of models

Select Top 3 Makes.Make , Count(*) as NumOfModels 
From MakeModels
Inner Join Makes On Makes.MakeID = MakeModels.MakeID
Group by Make
Order by NumOfModels Desc;




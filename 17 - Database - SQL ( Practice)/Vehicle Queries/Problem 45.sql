-- Problem 45: Get Number of Models Per Make 

Select Makes.Make,
Count(*) as [Number of Models]
From MakeModels
Inner Join Makes On Makes.MakeID = MakeModels.MakeID 
Group By Makes.Make 
Order By [Number of Models] DESC ;

------


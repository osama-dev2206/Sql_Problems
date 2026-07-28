-- DML 
insert into Dept(Id,DepetName) -- when you set the pk as identity you cann't insert the col id manually
values(1,'SWE'); 

insert into Dept(DepetName) 
values('SWE'); 

insert into Dept(DepetName) 
values('DS'); 

insert into Dept(DepetName) 
values('AI'); 

insert into Dept(DepetName) 
values('Marketing'); 

insert into Dept(DepetName) 
values('CS'); 

insert into Dept(DepetName) 
values('CyberSecurity'); 

Select * From Dept;

--if not exists(select * from sys.databases where name = 'db1')
--begin
--create database db1;
--end;
-- comment 

-- create database if itsn't existing 
if not exists(select * from sys.databases where name ='database1')
begin
create database database1 ;
end ;

use master;

if NOT EXISTS(select * from sys.databases where name = 'db2' )
begin
create database db2 ;
  
end ;

--use  db2 ;

--use master ;
--go ;
--Alter database db1 
--set single_user 
--without rollback immediate 

--drop database db1

create database database1; 

if exists(select * from sys.databases where name = 'database1')
drop database database1;

if Exists(select * from sys.databases where name = 'database1')
drop database database1 ; 
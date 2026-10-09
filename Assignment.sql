-- default constraint: set a default value for a column if no other value specified
create database college;
show databases;
use college;
create table Employee6(EmpId int NOT NULL, FirstName varchar(10), Lastname varchar(10), Empdept varchar(10) default 'Operation');

insert into Employee6 values(1,'A','B')

insert into Employee6(EmpId,FirstName,Lastname)
values(1,'Sam','Kaur');
insert into Employee6(EmpId,FirstName,Lastname)
values(2,'Khushi','Kaur');

select*from Employee6;

/*the create index statement is used to create indexes in tables. The user cannot see the indexes, they are just used to retrive data quikly,*/
create Index Demoindex on Employee6(FirstName);

show indexes from Employee6;

create Index Demoindex2 on Employee6(FirstName,Lastname);
show indexes from Employee6;

drop index Demoindex on Employee6;
drop index Demoindex2 on Employee6;

-- Auto increament
create table Persons(personid int NOT NULL AUTO_INCREMENT,LastName varchar(255) NOT NULL, FirstName varchar(255), Age int, PRIMARY KEY (Personid))

desc Persons;

insert into Persons(LastName,FirstName,Age)
values('Kaur','Sam',21);

insert into Persons(LastName,FirstName,Age)
values('Singh','Khushi',21);

select * from Persons;


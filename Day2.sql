-- DML 
create database college;
show databases;
use college;

create table Employees(EmpId int, FirstName varchar(10), 
Lastname varchar(10), EmpAge int, Empzone varchar(10));
desc Employees;

insert into Employees values(1,'Sam','Kaur',20,'South');  -- single row

insert into Employees(EmpId,FirstName,LastName,EmpAge,Empzone) 
values(2,'Koko','Kaur',21,'East'),
(3,'Khushi','Kaur',21,'West'),
(4,'Khushu','Singh',15,NULL); 				-- multiple row 

update employees set Empzone='North'where EmpId=1;
update employees set EmpZone='South'where EmpId=2;
update employees set EmpZone='East'where EmpId=3;
show databases;

update employees set EmpAge=25,Empzone='West' where EmpId=3;

delete from Employees where EmpId=3;
update employees set firstname='Adarsh' where EmpId=3;

select * from Employees;
select EmpId, Firstname from Employees;
truncate Employees; -- removes the row from the table without dropping the table

-- Not null constraint
Drop database college;
create database company_db;
use company_db;
show databases;

create table Employee(EmpId int NOT NULL, FirstName varchar(10), 
Lastname varchar(10), EmpAge int, Empzone varchar(10));

desc Employee;

insert into Employee values(NULL, 'Sam', 'Kumar', 25);

insert into Employee values(1, NULL, 'Kumar', 25);

insert into Employee values(1, 'Sam', 'Kumar', 25);

-- unique key constraint
create table Employee2(EmpId int NOT NULL, FirstName varchar(10), 
Lastname varchar(10), Unique (EmpId));

insert into Employee2 values(NULL, 'Sam', 'Kumar');

insert into Employee2 values(1, NULL, 'Kumar');

insert into Employee2 values(1, 'Sam', 'Kumar');

insert into Employee2 values(2, 'Sam', 'Kumar');

desc Employee2;

-- Check constraint while creating table
create table Employee3(EmpId int NOT NULL, FirstName varchar(10), 
Lastname varchar(10), EmpAge int, Check(EmpAge>20));
desc Employee3;

insert into Employee3 values(1, 'Sam', 'Kumar',23);

insert into Employee3 values(2, 'koko', 'Kumar',21);

insert into Employee3 values(3, 'Khush', 'Kumar',24);

alter table Employee3 add column salary int ,add check(Salary>=5000);

alter table Employee3 drop column salary;

alter table Employee3 add column Salary int ,add check(Salary>=5000);

desc Employee3;

insert into Employee3 values(4,'koko','Singh',25,7000);
insert into Employee3 values(5,'sam','Kaur',25,7000);
show create table employee3;
desc Employee3;

alter table Employee3 drop check employee3_chk_2;
desc Employee3;

-- Not null,check and primary key constraints
create table Employee6(EmpId int NOT NULL, FirstName varchar(10), 
Lastname varchar(10), EmpAge int, Check(EmpAge>20),,primary key(EmpId);

use Employee4;
insert into Employee4 values(1, 'Sam', 'Kumar',22);
insert into Employee4 values(1, 'Adarsh', 'Kumar',21);
insert into Employee4 values(4, 'Sam', 'Kumar',21)

insert into Employee4 values(2, 'koko', 'Kumar',21);

insert into Employee4 values(3, 'Khush', 'Kumar',24);

create table Employee8(EmpId int NOT NULL, FirstName varchar(10), 
Lastname varchar(10), EmpAge int,salary int);

alter table Employee8 add constraint chk_EmpAge_salary check(Empage>20) AND salary >=5000);
drop table Employee8;
show create table Employee8;

insert into Employee8 values(2,'Preet','Kaur',24,7000);

create table Employee9(EmpId int Not Null, Firstname varchar(10), Lastname varchar(10),EmpDept varchar(10) Default 'Operations');
desc Employee9;

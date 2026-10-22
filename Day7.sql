/*Basic of join queries*/
drop database basicjoin;
create database basicjoin;
use basicjoin;
create table employees(employee_id int primary key,ename varchar(50));
insert into employees values(101,'Sam');
insert into employees values(102,'Koko');
insert into employees values(103,'Kushu');
insert into employees values(104,'Adarsh');
insert into employees values(105,'Khushi');
insert into employees values(106,'Shreya');

create table project(project_id int primary key,pname varchar(50),employee_id int,foreign key(employee_id) references employees(employee_id));
insert into project(project_id,pname,employee_id)
values (1,'Project A',101),
		(2,'Project B',102),
        (3,'Project C',103),
        (4,'Project D',104),
        (5,'Project E',105);
Insert into project values(6,'Project G',NuLL);
select* from project;

-- inner join --
select*from employees
JOIN project 
ON employees.employee_id=project.employee_id;

select ename,pname from employees e
Inner Join project p
On e.employee_id=p.employee_id;

select ename,pname from project p
Inner Join employees e
On e.employee_id=p.employee_id;

select ename,pname from employees e
Right Join project p
On e.employee_id=p.employee_id;

select*from employees;
select*from project;

select e.employee_id,ename,pname from employees e
left Join project p
On e.employee_id=p.employee_id;

insert into project(project_id,pname)
values(8,'Project I');
select*from project;

-- left join=inner join+ any additional records --

-- Full outer join using union --
-- display all matching and non matching data from both tables --
select*from employees
left join project
ON employees.employee_id=project.employee_id 		-- here we dont use object because we have to see whole table not the particular column --
UNION
select*from employees
Right join project
ON employees.employee_id=project.employee_id;

-- Display employee name who has not been assigned any project--
select employees.ename,project.pname
from employees
left join project
on employees.employee_id=project.employee_id
where project.employee_id is not null;

select employees.ename,project.pname
from employees
left join project
on employees.employee_id=project.employee_id
where project.employee_id is null;
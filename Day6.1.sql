/*Filtering data from tables*/
-- where,select distict,and,or,not,in,not in,between,like,limit,is null
create database organization;
use organization;
create table employee(Empid int not null primary key,First_name varchar(15),Last_name varchar(15), Gender char,Role varchar(15),Dept varchar(15),Manager_id varchar(10));
insert into employee values(1,'Sam','Kaur','F','Software dev','Tech','M11');
insert into employee values(2,'Khush','Kaur','M','Devops','Tech','M41');
insert into employee values(3,'Adarsh','Singh','M','Cloud dev','Tech','M21');
insert into employee values(4,'Koko','Almast','F','Frontend dev','Tech','M14');
insert into employee values(5,'Shreya','Udasin','F','Backend dev','Tech','M13');
insert into employee values(6,'Sejal','Udasin','F','Gaming dev','Tech','M12');
select*from employee;

/*select distinct keyword*/
-- distinct clause will only preserve one null value since it considers all null valuess to be the same.
select distinct Dept from employee order by Dept;
select distinct Role from employee order by Role;

/*Distinct clause to get all the unique values of the role column*/
-- AND operator: The AND opertor is a logical operator that combines two or more Boolean expression and returns 1,0,null.The AND operator is used for filtering data with the Where cLause

select*from Employee where role='President' and dept='HR';
select*from Employee where role='Devops' and dept='Tech';
/*OR operator: the OR operator is a logical operator that combines two Bollean*/
select*from employee where role='Backend dev' or role='Cloud dev';
select*from employee where role='Cloud' or role='Software dev';

/*IN operator*/
select*from employee where role in('Cloud dev','Devops');
select*from employee where role in('Backend dev','Frontend Dev');
/*Not In operator: THe not in operator is formed by combining the not and in operators. the not in operator, in contrast */
select *from employee where role not in('Cloud dev','Devops');
/*Between operator: the btween operatr is logical operator that determines whether a value belongs in a range. the between operator returns Null if the value,low or high is Null.*/
Alter table employee add column Experience int;
select*from employee;
update employee set Experience=8 where Empid=1;
update employee set Experience=7 where Empid=2;
update employee set Experience=6 where Empid=3;
update employee set Experience=9 where Empid=4;
update employee set Experience=3 where Empid=5;
update employee set Experience=6 where Empid=6;
desc employee;

select*from employee;

select*from employee where Experience between 6 and 10; -- between operator
select*from employee where Experience=6 or Experience=9;
/**Like operator: The like operator is a logical operator that determines whether or not a string contains a specified pattern.*/

select*from employee where last_name like 'd%';
select*from employee where last_name like 'U%';

/*Limit operator: the limit clause in select satatement is used to limit the number of rows returned*/
select*from Employee;
select*from Employee order by experience limit 5; -- limit the no. of rows

/*Is NULL: the is null operator determines whether or not a value is null.the expression returns 1(true) if the value is Null*/
insert  into employee values(7,'Asta','Magic','M','President','HR',' ',Null);
 select * from employee;
 select * from employee where Manager_id is null; 
insert into employee values(7,'Kashish','Joshi','F','President','HR',' ',null),
(8,'Khushu','Tilokani','M','Manager',' ',' ',' ',null),
(9,'Khushi','Almast','F','Gaming dev','Tech',' ',null,null);

select *from employee where manager_id is null;
select *from employee where role is null;
select * from employee;

/*aggregate functions*/
/*COUNT,SUM,AVG,MIN,MAX*/
select count(*) from employee;
select count(Empid) from employee where dept='Tech'; -- count--
select min(Experience) from employee; -- min
select max(Experience) from employee; -- max
select sum(Experience) from employee; -- sum
select avg(Experience) as emp_exr from employee; -- avgerage-- -- emp_exr is alisas name

/*Group by clause:- Group by clause divides a set of rows into subgroups depending on column or expression values. The group by cluse is used with aggregate functions such as SUM,AVG,MAX,MIN, and COUNT.*/

-- find the dept wise employee count
select dept,count(*) as employee_count from employee group by dept;

-- find the role wise employee count
select role,count(*) as employee_count from employee group by role;

-- find the gender wise employee count
select gender,count(*) as employee_count from employee group by gender;

/*Having clause:- Each grp produced by the group clause is evaluated by the having clause, and if the result is true, the row is included in the result set. The having cluase was added to SQL because the WHERE keyword cannot be used with aggregate functions.*/
-- retail=18 finance-13 hr-21
select*from employee;
select dept,sum(experience) as total_experience from employee group by dept having total_experience>=5 AND total_experience<=10;
select role,sum(experience) as total_experience from employee group by role having total_experience>=5 AND total_experience<=10;

-- fetch department wise employee count using having clause and sort the data
select dept,count(empid) from employee group by dept having count(empid) >2 order by count(empid);

select dept,sum(experience) as total_experience from employee group by dept having total_experience>=5 Or total_experience<=10;


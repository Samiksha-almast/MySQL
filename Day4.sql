-- start a new transcation
/* begin;
-- or
start transcation; -- to execute multiple statements as a single transaction,
we must explicity start the transcation
commit:- save all changes made during the transcation
rollback:- undoes all changes made during the transcation
savepoint:- sets a savepoit within a  transcation to roll back to later
rollback to savepoint:- rools back to a specific savepoint without affecting earlier changes.*/

drop database tcl;
create database tcl;
use tcl;

create table orders(
	order_id int primary key,
    customer_name varchar(100),
    statys varchar(50)
);
    
desc orders;

-- start transcation
set autocommit=0; -- in mysql autocommit is enabled by the default which means whenever we execute any sql statement is automatically commited.
/*so in such cases succeded transcation are automatically commited. to display the auto commit mode we are using this */
-- in ddl commands auto commit cannot be disabled.

begin; -- or start trancation

-- for commit
insert into orders values(101,'Sam','Pending');
insert into orders values(102,'Koko','Pending');
commit;
-- if don't commit it, it will delete the whole table
-- each changes has to be commited to see the result of rollback if you change anything

desc orders;
update orders set customer_name='Khush' where order_id=102;
rollback;

-- step1: insert few orders
insert into orders values(103,'Khush','Pending');
insert into orders values(104,'Adarsh','Pending');
insert into orders values(105,'Khushi','Pending');
-- commit; 	 if you want
savepoint sp1;
select*from orders;

-- step2: update one order
update orders set statys='Shipped' where order_id=103;
savepoint sp2;
rollback to savepoint sp1;

-- step3:- delete another order
delete from orders where order_id=102;
savepoint sp3;

-- we want to undo the delete but keep the update
rollback to savepoint sp2;
select *from orders;
rollback;

-- truncate table orders;
select *from orders;
rollback;

create database company_db;
use company_db;
create table Employee(Emp_id int, firstname varchar(20), lastname varchar(20), Empage int, salary int);
insert into Employee value(1,'Sam','Kaur',21,100000);
insert into Employee value(2,'Khush','Kaur',23,100000);
insert into Employee value(3,'Adarsh','Kaur',22,100000);
insert into Employee value(4,'Khushi','Kaur',24,100000);

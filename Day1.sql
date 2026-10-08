CREATE DATABASE INSTITUTE;
USE INSTITUTE;
CREATE TABLE STAFF(STAFF_ID int,FIRST_NAME varchar(10), LAST_NAME varchar(10),DOB date,DEPT_ID int);

Create table department(dept_id int, dept_name varchar(10), dept_location varchar(15));
 desc staff;
 desc department;
 
 /*add a column to an exsiting table,*/
 -- Add column location and joining year in staff table
 -- syntax: alter table tablename Add columnname datatype():

 alter table staff add location varchar(15); -- to add single column
 alter table staff add joining_year int;-- to add  column
 alter table staff add age int,add contact_no int(10); -- or  alter table staff add (age int, contact_no int(10));
 
 /* change the datatype of a column in an existing table.*/
 -- syntax: Alter table tablename Modify columnname datatype();
 
 Alter table staff Modify first_name text;
  desc staff;

 /* drop a column from an existing table.*/
 -- syntax: Alter table tablename drop column columnname;
 
 Alter table staff drop column contact_no;
 desc staff;
 
 /*Modify the datatype size.*/
 Alter table staff Modify last_name varchar(30);
desc staff;

 /*Create a forgein key constraint between two tables.*/
 -- first created the primary key constaint on tables.
 -- syntax: Alter table tablename Add Primary key (columnname);
 
 Alter table staff add primary key(staff_id);
 Alter table department add primary key(dept_id);

/**Drop primary key constraint from departments*/
/*syntax: Alter table tablename drop primary key;

Alter table department drop primary key; 
desc department;

/*add foreign key*/
/* syntax: alter table tablename add foreign key
(columnname) references 2nd tablename (columnname);*/

alter table staff add foreign key(dept_id)
references department (dept_id);

/*forieng key constraint*/
alter table staff add constraint fk_staff_department
foreign key (dept_id) references department(dept_id);

alter table staff drop foreign key fk_staff_department;

/*Rename a table.*/
-- syntax: alter table tablename rename newtablename;
alter table staff rename staff1; -- or rename table staff1 to staff;
desc staff1;


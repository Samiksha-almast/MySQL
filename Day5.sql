create database user;
show databases;
use user;

create table customer(Custid int, Custname varchar(15), City varchar(10),product varchar(15),Price int);
desc customer;

insert into customer values(101,'Sam','Nagpur','Laptop',60000);
insert into customer values(102,'Koko','Chandrapur','Tab',30000);
insert into customer values(103,'Adarsh','Nagpur','PC',600000);
insert into customer values(104,'Khush','Nagpur','Phone',63000);

select *from customer;

alter table customer add primary key(Custid);

select custid,custname,city from customer;

select*from customer where custid=3;

select * from customer where custid=103 or custid=101;

create table CloneTable as select * from customer;

select * from CloneTable;

drop table CloneTable;

select custname,product,price from customer where price>60000;
select custname,product,price from customer where price<60000;
select custname,product,price from customer where price>=60000;
select custname,product,price from customer where price<=60000;
select custname,product,price from customer where price=60000;

select * from customer where city='Nagpur';
select * from customer where city='Chandrapur';

/*Sorting data using order by single column*/
select * from customer order by price;
select * from customer order by price desc;

/*Sorting data order by multiple columns*/
select*from customer order by city,price; /*city only happen because it gives the priority to first mention*/
select*from customer order by price,city;

select*from customer order by city desc, price asc;
select*from customer order by price desc, city asc;

/*single row functions*/
/*case conversion functions*/

select upper(Custname),lower(Product) from customer where custid<3; -- uppercase and lower case function --
select upper(Custname),lower(Product) from customer; -- it will be applied to all 

alter table customer add column lastname varchar(10);
select * from customer;

update customer set lastname='Kaur' where custid=101;
update customer set lastname='Singh' where custid=102;
update customer set lastname='Udasin' where custid=103;
update customer set lastname='Almast' where custid=104;

select * from customer;

/*Concat two column*/
select concat(custname,' ',lastname) from customer;

/*to give alias name to the column*/
select concat(custname,' ',lastname) as FullName from customer;
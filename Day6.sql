
/*Date and time function*/

select now();
select now() as current_datatime;
alter table customer add column date date;
select*from customer;

update customer set date='2024/2/20' where custid=101;
update customer set date='2024/3/20' where custid=102;
update customer set date='2024/4/20' where custid=103;
update customer set date='2024/5/20' where custid=104;
select*from customer;
-- alter table customer drop column date;

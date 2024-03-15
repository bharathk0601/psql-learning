select distinct store_id from customer;

select count(*) from customer;

select count(distinct(c1.store_id)) as store_count(aliasng happens after query executed so cannot using aliasing name in where clause) from customer as c1;

--order by
select * from customer
where store_id = 1
order by store_id ASC, first_name DESC

create table if not exists order_by_test(id int, age int);
insert into order_by_test values(1,10),(1,20),(2,40),(3,20);

select * from order_by_test order by id DESC, age DESC;
if the 2 rows has same value then effect of second order by can be seen;

--between same as >= <=
select * from actor
where last_update between '2013-05-26' and '2013-05-27';

select * from actor
where last_update NOT between '2013-05-26' and '2013-05-27';

select * from payment
where payment_date between '2007-02-15' and '2007-02-17'; >= 2007-02-15 00:00:00:0000 <= 2007-02-17 00:00:00:0000;

-- IN can be used for avoiding chaining of or condition.
select * from payment
where customer_id IN(341,342,345);

select * from payment
where customer_id NOT IN(341,342,345);

--LIKE and ILIKE
Bette
Matthew

select * from actor where first_name LIKE '%tt%'; -- begins with ends with or contains
select * from actor where first_name LIKE '%tt'; -- ends with.
select * from actor where first_name LIKE 'S%'; -- begins with 
-- % means any number of character.
select * from actor where first_name LIKE '_a%'; -- one any character then a begins with then any no of character.
select * from actor where first_name ILIKE 's%'; -- insensitive comparision. 
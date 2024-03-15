-- SOME IMPORTANT FUNCTIONS.

-- DATE AND TIME FUNCTIONS.

select NOW(), CURRENT_TIMESTAMP; -- CURRENT_TIMESTAMP date time 2022-09-03 10:58:51.982968+05:30
select DATE(NOW()); -- date part 2022-09-03
select CURRENT_DATE; -- 2022-09-03
select CURRENT_TIME; -- only time with time zone 10:59:40.499604+05:30

select EXTRACT(MONTH FROM CURRENT_TIMESTAMP);
select EXTRACT(DAY FROM CURRENT_TIMESTAMP);
select EXTRACT(DOW FROM CURRENT_TIMESTAMP);
select EXTRACT(YEAR FROM CURRENT_TIMESTAMP);
select EXTRACT(HOUR FROM CURRENT_TIMESTAMP);
select EXTRACT(MINUTE FROM CURRENT_TIMESTAMP);
select EXTRACT(SECOND FROM CURRENT_TIMESTAMP);

select TO_CHAR(CURRENT_TIMESTAMP,'yyyy'); 
select TO_CHAR(CURRENT_TIMESTAMP,'yyyy-mm-dd\Thh24:mi:ss+00:00');
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'ms');
select DATE(NOW());
select NOW()::DATE;

--  MATHEMATICAL FUNCTIONS.
select ROUND(rental_rate / replacement_cost, 2) * 100 as PERCENTAGE from film;
select ROUND(rental_rate / replacement_cost, 2) * 100 as "PERCENTAGE" from film;

-- STRING FUNCTIONS

select first_name ||  ' ' || last_name from customer; -- concatenation.
select length(first_name) from customer; -- lenth function.
select UPPER(first_name) from customer;
select LOWER(first_name) from customer;
select LEFT(first_name, 2) from customer;
select RIGHT(first_name, 2) from customer;

-- SUB QUERY
select f1.film_id from film as f1
where rental_rate > (select AVG(f2.rental_rate) from film as f2);

select f1.film_id from film as f1
where rental_rate > (select AVG(f2.rental_rate) from film as f2);

select f1.film_id from film as f1
where EXISTS (select AVG(f2.rental_rate) from film as f2); -- EXISTS chack sub query returns 1 or more row or not.

select f1.film_id from film as f1
where NOT EXISTS (select AVG(f2.rental_rate) from film as f2);

select * from film where film_id IN
(select inventory.film_id
from rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
where return_date between '2005-05-29' and  '2005-05-30');

select * from customer as c
where exists
(select * from payment as p
 where p.customer_id = c.customer_id AND amount > 11
);

select * from customer as c
where not exists
(select * from payment as p
 where p.customer_id = c.customer_id AND amount > 11
);

-- SELF JOIN

SELECT f1.title, f2.title, f1.length
FROM film AS f1
INNER JOIN film AS f2
ON f1.film_id != f2.film_id
AND f1.length = f2.length;


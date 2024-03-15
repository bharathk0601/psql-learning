-- JOINS

--INNER JOIN
-- INTERSECTION excat match.
select * from customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id; -- you can use multiple condition using AND OR NOT. 

select * from customer, payment
where payment.customer_id = customer.customer_id;

-- FULL OUTER JOIN
-- selects all the values from both tables where match is not found there null value is filled.
select * from customer
FULL OUTER JOIN rental
ON rental.customer_id = customer.customer_id;

-- LEFT OUTER JOIN
-- selects all the values from left table and matched condition from right table left table unmatched values filled with NULL.
select * from customer
LEFT OUTER JOIN payment p
ON payment.customer_id = customer.customer_id -- join first
where customer.customer_id IS NULL; -- where should be last

-- RIGHT OUTER JOIN
-- vice versa of left join.
select * from customer
RIGHT OUTER JOIN payment
ON payment.customer_id = customer.customer_id
where customer.customer_id IS NULL;

-- UNION combines all the tables.

select customer_id from customer
		UNION
select customer_id from payment

-- INTERSECT combines common rows

select customer_id from customer;
		INTERSECT
select customer_id from payment;

-- new things

select * from customer (as optional) c
LEFT OUTER JOIN payment (as optional) p
ON p.customer_id = c.customer_id -- join first
where c.customer_id IS NULL; -- where should be last
-- if you alias table name then you should use aliasing name instead of table name where ever required.

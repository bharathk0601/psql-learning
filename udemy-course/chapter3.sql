SELECT SUM(replacement_cost), AVG(replacement_cost),
MIN(replacement_cost), MAX(replacement_cost), COUNT(*),
ROUND(AVG(replacement_cost), 2) from film;

SELECT SUM(replacement_cost)::int;

select staff_id, COUNT(amount) from payment
group by staff_id;

select staff_id, COUNT(amount) from payment
where staff_id = 1 -- where first
group by staff_id; -- group by next

select rating, ROUND(AVG(replacement_cost),2) from
film 
group by rating;

select customer_id, SUM(amount) from payment
group by customer_id 
order by COUNT(*) DESC
limit 5;

SELECT * FROM customer ORDER BY customer_id ASC LIMIT 5 OFFSET 0;

select customer_id, count(*) from
payment
group by customer_id having count(*) >= 40;

select customer_id, sum(amount) from
payment
where staff_id in (2)
group by customer_id having sum(amount) > 100;
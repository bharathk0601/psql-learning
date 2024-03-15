-- joins

-- inner join
SELECT * FROM salesman t1
	INNER JOIN customer t2 
	ON t1.salesman_id = t2.salesman_id -- intersection maps to the comman values
WHERE commission > 0.12;

SELECT * FROM salesman t1,customer t2
WHERE t1.salesman_id = t2.salesman_id AND commission > 0.12; -- alternative for inner join

-- full outer join
SELECT * FROM salesman t1
	FULL OUTER JOIN customer t2 
	ON t1.salesman_id = t2.salesman_id
WHERE commission > 0.12;

SELECT * FROM salesman t1
	INNER JOIN customer t2 
	ON true  -- any join will give cartesian product
WHERE commission > 0.12;

SELECT * FROM salesman t1 FULL OUTER JOIN customer t2 ON TRUE; -- alternate SELECT * FROM salesman t1,customer t2;

-- cross join
SELECT * FROM salesman t1,customer t2;

--left join
SELECT * FROM salesman t1 LEFT OUTER JOIN customer t2 ON t1.salesman_id = t2.salesman_id;
-- in the right table match not found select null valued column.

--right join
SELECT * FROM salesman t1 RIGHT OUTER JOIN customer t2 ON t1.salesman_id = t2.salesman_id;
-- in the left table match not found select null valued column.

-- self join 
SELECT DISTINCT t1.customer_id FROM customer t1 INNER JOIN customer t2 ON t1.salesman_id <> t2.salesman_id;
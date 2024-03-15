-- basics
SELECT * FROM salesman ORDER BY salesman_id ASC LIMIT 2 OFFSET 3;
SELECT * FROM salesman WHERE salesman_id = 5001;
SELECT DISTINCT salesman_id FROM salesman;
SELECT DISTINCT * FROM salesman;
SELECT COUNT(*) FROM salesman;
SELECT * FROM salesman WHERE NAME IN('james hog', 'nail knite');
SELECT * FROM salesman WHERE commission BETWEEN 0.11::REAL AND 0.15::REAL;
SELECT * FROM salesman WHERE name LIKE 'james%'; -- begins with
SELECT * FROM salesman WHERE name LIKE '%alex'; -- ends with
SELECT * FROM salesman WHERE name ILIKE '%Alex'; -- ends with -- conert to same case then match.

-- salesman who had 2 customers.
SELECT * FROM salesman 
where (SELECT COUNT(*) FROM customer WHERE salesman.salesman_id = customer.salesman_id) > 1;

SELECT salesman.salesman_id, salesman.name, customer.name FROM salesman -- ERROR beacuse for 1 salesman_id there 2 entry in cutomer table so must appear in group by
INNER JOIN customer 
ON salesman.salesman_id = customer.salesman_id
GROUP BY salesman.salesman_id HAVING COUNT(*) > 1;

-- salesman who add atleast 1 purchase
SELECT * FROM salesman WHERE 
EXISTS(SELECT * FROM customer WHERE customer.salesman_id = salesman.salesman_id);

-- aggregate
SELECT COUNT(*), salesman_id FROM customer GROUP BY salesman_id; -- cannot use * on GROPU BY must use aggregate function.

-- set operation
SELECT salesman_id FROM salesman
	UNION -- selects unique values
SELECT salesman_id FROM CUSTOMER;

SELECT salesman_id FROM salesman
	UNION ALL -- selects duplicate also
SELECT salesman_id FROM CUSTOMER;

SELECT salesman_id FROM salesman
	INTERSECT -- selects comman values
SELECT salesman_id FROM CUSTOMER;

SELECT salesman_id FROM salesman
	EXCEPT -- subtracts comman fields from both the tables and selects remaining fields from first table.
SELECT salesman_id FROM CUSTOMER;

-- case
SELECT customer_id,
CASE 
	WHEN grade >= 70 AND grade <= 100 THEN 'A'
	WHEN grade >= 50 AND grade < 70 THEN 'B'
	ELSE 'C'
END
FROM customer;

SELECT  grade_symbol, COUNT(*) FROM (
	SELECT *,
		CASE 
			WHEN grade >= 70 AND grade <= 100 THEN 'A'
			WHEN grade >= 50 AND grade < 70 THEN 'B'
			ELSE 'C'
		END as grade_symbol FROM customer) 
AS t1 GROUP BY grade_symbol; 

-- max salary
SELECT MAX(salary) FROM table_name WHERE SALARY <> (SELECT MAX(SALARY) FROM table_name);

-- nth max salary
SELECT salary FROM table_name ORDER BY salary DESC LIMIT 1 OFFSET n-1;



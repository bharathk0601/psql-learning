-- COALESCE

select 1 - NULL;
select 1 - COALESCE(NULL, 0);
SELECT COALESCE(NULL, NULL, 8, 1); -- returns first NON NULL value.

-- CAST

SELECT CAST('2022-01-01' AS TIMESTAMP);
SELECT LENGTH(inventory_id::VARCHAR) FROM rental;

--NULL IF
    -- returns null if both the values are same otherwise returns first value
    SELECT NULLIF(1,2); -- 1;
    SELECT NULLIF(1,1); -- null;

-- VIEWS

CREATE OR REPLACE VIEW customer_info AS (SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id);

SELECT * FROM customer_info;

DROP VIEW IF EXISTS customer_info;

ALTER VIEW customer_info RENAME TO c_info;

-- CASE

SELECT customer_id,
CASE
	WHEN customer_id <= 100 THEN 'A'
	WHEN customer_id BETWEEN 101 AND 300 THEN 'B'
	ELSE 'C' -- OPTIONAL
END	AS customer_class
FROM customer;

SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second'
	ELSE 'Normal'
END	AS customer_class
FROM customer;

SELECT 
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS "SUM"
FROM film;

SELECT 
SUM(
	CASE rating
		WHEN 'R' THEN 1
		ELSE 0
	END
) as r,
SUM(
	CASE rating
		WHEN 'PG' THEN 1
		ELSE 0
	END
) as pg,
SUM(
	CASE rating
		WHEN 'PG-13' THEN 1
		ELSE 0
	END
) as pg13
FROM FILM;

CREATE TABLE dept(name varchar(50), id int);
INSERT INTO dept(name, id) values('n1', 4),('n2', 4),('n3', 5);

SELECT
	SUM(
		CASE
			WHEN id = 4 THEN 1
			ELSE 0
		END
	)/
	SUM(
		NULLIF(CASE
			WHEN id = 3 THEN 1
			ELSE 0
		END, 0)
	) AS ratio
	
FROM dept;





-- creating table with constraint.

CREATE TABLE IF NOT EXISTS test (
id serial,
val1 int,
constraint pk_serial PRIMARY KEY (id)
);

CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMPTZ
);

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id) ON DELETE CASCADE,
	hire_date TIMESTAMPTZ
);

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER,
	hire_date TIMESTAMPTZ,
	FOREIGN KEY(job_id) REFERENCES job(job_id)
);

CREATE TABLE t1() inherits(job);

-- inserting with select statement

INSERT INTO account(user_name, password, email, created_on)
VALUES
('Jose', '12345', 'jose@gmail.com', CURRENT_TIMESTAMP);

INSERT INTO job(job_name)
VALUES('coder');

INSERT INTO job(job_name)
VALUES('engineer'), ('manager') returning job_id;

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES(1, 1, CURRENT_TIMESTAMP);

insert into test(val1) select(1);

-- UPDATING column values

UPDATE account
SET last_login = CURRENT_TIMESTAMP
WHERE last_login IS NULL;

UPDATE account
SET last_login = created_on
returning user_id, user_name;

UPDATE account_job 
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id;


UPDATE account_job t1
SET hire_date = created_on
FROM account as t2
WHERE t1.user_id = t2.user_id;

-- DELETE

DELETE FROM job
WHERE job_name = 'manager'
RETURNING job_id;

--ALTER TABLE

ALTER TABLE info RENAME TO new_info;

ALTER TABLE new_info
RENAME COLUMN name to name2;

ALTER TABLE new_info
ALTER COLUMN name2 SET NOT NULL;

ALTER TABLE new_info
ALTER COLUMN name2 
SET   DEFAULT NULL;

ALTER TABLE new_info
ALTER COLUMN name2  
DROP NOT NULL;

ALTER TABLE new_info ADD COLUMN test varchar(50) NOT NULL;
ALTER TABLE new_info
ADD COLUMN IF NOT EXISTS name3 varchar,
ADD COLUMN name5 varchar;

ALTER TABLE new_info DROP COLUMN test;
ALTER TABLE new_info
DROP COLUMN IF EXISTS name4,
DROP COLUMN name5;

ALTER TABLE new_info ADD CONSTRAINT uq_name UNIQUE(name2);
ALTER TABLE new_info DROP CONSTRAINT uq_name;
ALTER TABLE account_job
ADD CONSTRAINT fk FOREIGN KEY(job_id) REFERENCES job(job_id) ON DELETE SET NULL;

ALTER TABLE new_info ALTER COLUMN name2 TYPE text;
ALTER TABLE new_info
ALTER COLUMN name3 type char,
ALTER COLUMN name4 type char;

-- DROP TABLE
DROP TABLE job CASCADE; -- will not delete child records

--CHECK constraint

CREATE TABLE person_info(
name varchar(50),
age int default 0 check (age >= 0),
price double precision default null,
check (price >= 0) 
);

CREATE TABLE person_info1(
name varchar(50),
age int default 0 check (age >= price), -- column order doesn't matter.
price double precision default null,
check (price >= 0) 
);

INSERT INTO person_info(name, price) 
values('a', null);

ALTER TABLE person_info
RENAME COLUMN price to salary;

INSERT INTO person_info(name, salary) 
values('a', -1.5);

ALTER TABLE person_info ADD COLUMN b_date DATE CHECK (b_date >= '2000-01-01');


INSERT INTO person_info(name, salary, b_date) 
values('a', 1.5, '2001-01-01');
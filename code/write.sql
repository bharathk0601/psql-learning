CREATE TABLE IF NOT EXISTS salesman(
    salesman_id INTEGER,
    name VARCHAR(20),
    city VARCHAR(20),
    commission REAL,
    CONSTRAINT pk_salesman_id PRIMARY KEY(salesman_id)
);

ALTER TABLE salesman ADD CONSTRAINT uk_salesman_id UNIQUE(salesman_id);
ALTER TABLE salesman DROP CONSTRAINT uk_salesman_id cascade;
ALTER TABLE salesman ADD CONSTRAINT pk_salesman_id PRIMARY KEY(salesman_id);

DROP TABLE salesman CASCADE;

CREATE TABLE IF NOT EXISTS customer(
    customer_id INTEGER,
    name VARCHAR(20),
    city VARCHAR(20),
    grade INT,
    salesman_id INTEGER,
    CONSTRAINT pk_customer_id PRIMARY KEY(customer_id),
    CONSTRAINT check_grade check (grade <= 100),
    CONSTRAINT fk_salesman_id FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id) ON DELETE SET NULL ON UPDATE CASCADE-- CASCADE
);

ALTER TABLE customer 
ALTER COLUMN name type varchar(15),
ALTER COLUMN city type varchar(15);

INSERT INTO salesman(salesman_id, name, city, commission) values
(5001, 'james hog', 'new york', 0.15),
(5002, 'nail knite', 'paris', 0.13),
(5005, 'pit alex', 'london', 0.11),
(5006, 'mc lyon', 'paris', 0.14),
(5007, 'paul adam', 'rome', 0.13),
(5003, 'lauson hen', 'san joe', 0.12);

INSERT INTO salesman(salesman_id, name, city, commission) values (5001, 'james hog', 'new york', 0.15)
ON CONFLICT (salesman_id) DO NOTHING;

INSERT INTO salesman(salesman_id, name, city, commission) values (5001, 'james hog', 'new york', 0.15)
ON CONFLICT ON CONSTRAINT pk_salesman_id DO NOTHING;

UPDATE salesman SET commission = 0.11, salesman_id = 5008 WHERE salesman_id = 5001 RETURNING name;

INSERT INTO customer(customer_id, name, city, grade, salesman_id) VALUES
(3002, 'nick rimando', 'new york', 100, 5001),
(3007, 'brad davis', 'new york', 99, 5001),
(3005, 'graham zusi', 'california', 50, 5002),
(3008, 'julian green', 'london', 75, 5002),
(3004, 'fabian johnson', 'paris', 67, 5003),
(3003, 'jozy altidor', 'moscow', 60, 5007),
(3001, 'gran guzan', 'london', 15, NULL);
INSERT INTO country(country_code, holiday_year) VALUES('${countryCode}','${year}') ON CONFLICT ON CONSTRAINT uq_year_code_together DO NOTHING RETURNING id



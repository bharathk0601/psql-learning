-- functions
CREATE OR REPLACE FUNCTION test()
RETURNS RECORD
AS $body$
DECLARE
ccount INTEGER;
scount INTEGER;
BEGIN
    ccount = (SELECT COUNT(*) FROM customer);
    scount = (SELECT COUNT(*) FROM salesman);

    RETURN (ccount, scount);
END;
$body$ LANGUAGE plpgsql;

DROP FUNCTION test;

CREATE OR REPLACE FUNCTION add_sub(IN num1 INT, IN num2 INT, OUT sum INT, OUT sub INT, INOUT num3 INT)
AS $body$
BEGIN
    sum := num1 + num2 + num3;
	sub = num1 - num2 - num3;
	num3 = num1 * num2 * num3;
END;
$body$ LANGUAGE plpgsql;

SELECT * FROM add_sub(1, 2, 1);

--triggers

CREATE OR REPLACE FUNCTION increase_commission()
RETURNS trigger
AS $body$
BEGIN
    new.commission = new.commission + TG_ARGV[0]::REAL;
    RAISE NOTICE 'old %', old.commission;
    RAISE NOTICE 'new %', new.commission;
    RAISE NOTICE 'arg % nargs %', TG_ARGV[0], TG_NARGS;

    RETURN new;
END;
$body$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER increase_commission
BEFORE INSERT OR UPDATE
ON salesman
FOR EACH ROW EXECUTE PROCEDURE increase_commission(1.5);

DROP FUNCTION increase_commission CASCADE;
DROP TRIGGER trigger_name ON table_name;
